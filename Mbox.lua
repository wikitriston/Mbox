--  /'\_/`\                                                   
-- /\      \     __    ____    ____     __       __      __   
-- \ \ \__\ \  /'__`\ /',__\  /',__\  /'__`\   /'_ `\  /'__`\ 
--  \ \ \_/\ \/\  __//\__, `\/\__, `\/\ \L\.\_/\ \L\ \/\  __/ 
--   \ \_\\ \_\ \____\/\____/\/\____/\ \__/.\_\ \____ \ \____\
--    \/_/ \/_/\/____/\/___/  \/___/  \/__/\/_/\/___L\ \/____/
--                                              /\____/      
--                                              \_/__/       
--  ____                                                      
-- /\  _`\                                                    
-- \ \ \L\ \    ___   __  _                                   
--  \ \  _ <'  / __`\/\ \/'\                                  
--   \ \ \L\ \/\ \L\ \/>  </                                  
--    \ \____/\ \____//\_/\_\                                 
--     \/___/  \/___/ \//\/_/                                 
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--   META - Module fork from miraheze dev but with added features
--   Auhtor: Nguyễn Ngọc Thảo
--   Powered by WikiTriston
--   GLP 3.0 licence
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require('strict')
local getArgs
local yesno = require('Module:Yesno')

-- Get a language object for formatDate and ucfirst.
local lang = mw.language.getContentLanguage()

-- Define constants
local CONFIG_MODULE = 'Module:Message box/data' -- Đã đổi tên từ /configuration sang /data
local DEMOSPACES = {user = 'tmbox', talk = 'tmbox', image = 'imbox', file = 'imbox', category = 'cmbox', article = 'ambox', main = 'ambox'}

--------------------------------------------------------------------------------
-- Helper functions
--------------------------------------------------------------------------------

local function getTitleObject(...)
	-- Get the title object, passing the function through pcall
	-- in case we are over the expensive function count limit.
	local success, title = pcall(mw.title.new, ...)
	if success then
		return title
	end
end

--------------------------------------------------------------------------------
-- Box class definition
--------------------------------------------------------------------------------

local MessageBox = {}
MessageBox.__index = MessageBox

function MessageBox.new(boxType, args, cfg)
	args = args or {}
	local obj = {}

	-- Set the title object and the namespace.
	obj.title = getTitleObject(args.page) or mw.title.getCurrentTitle()

	-- Set the config for our box type.
	obj.cfg = cfg[boxType]
	if not obj.cfg then
		local ns = obj.title.namespace
		-- boxType is "mbox" or invalid input
		if args.demospace and args.demospace ~= '' then
			-- implement demospace parameter of mbox
			local demospace = string.lower(args.demospace)
			if DEMOSPACES[demospace] then
				-- use template from DEMOSPACES
				obj.cfg = cfg[DEMOSPACES[demospace]]
			elseif string.find( demospace, 'talk' ) then
				-- demo as a talk page
				obj.cfg = cfg.tmbox
			else
				-- default to ombox
				obj.cfg = cfg.ombox
			end
		elseif ns == 0 then
			obj.cfg = cfg.ambox -- main namespace
		elseif ns == 6 then
			obj.cfg = cfg.imbox -- file namespace
		elseif ns == 14 then
			obj.cfg = cfg.cmbox -- category namespace
		else
			local nsTable = mw.site.namespaces[ns]
			if nsTable and nsTable.isTalk then
				obj.cfg = cfg.tmbox -- any talk namespace
			else
				obj.cfg = cfg.ombox -- other namespaces or invalid input
			end
		end
	end

	-- Set the arguments, and remove all blank arguments except for the ones
	-- listed in cfg.allowBlankParams.
	do
		local newArgs = {}
		for k, v in pairs(args) do
			if v ~= '' then
				newArgs[k] = v
			end
		end
		for i, param in ipairs(obj.cfg.allowBlankParams or {}) do
			newArgs[param] = args[param]
		end
		obj.args = newArgs
	end

	-- Define internal data structure.
	obj.categories = {}
	obj.classes = {}

	return setmetatable(obj, MessageBox)
end


function MessageBox:addClass(class)
	if not class then
		return nil
	end
	table.insert(self.classes, class)
end

function MessageBox:setParameters()
	local args = self.args
	local cfg = self.cfg

	-- Xử lý chuẩn hóa type và ánh xạ Alias
	local rawType = args.type
	if rawType then
		-- Cắt khoảng trắng dư thừa và chuyển về chữ thường
		rawType = mw.text.trim(mw.ustring.lower(rawType))
		-- Kiểm tra xem có cấu hình alias cho kiểu nhập này không
		if cfg.aliases and cfg.aliases[rawType] then
			self.type = cfg.aliases[rawType]
		else
			self.type = rawType
		end
	else
		self.type = nil
	end

	local typeData = cfg.types[self.type]
	self.invalidTypeError = cfg.showInvalidTypeError
		and self.type
		and not typeData
	typeData = typeData or cfg.types[cfg.default]
	self.typeClass = typeData.class
	self.typeImage = typeData.image

	-- Find whether we are using a small message box.
	self.isSmall = cfg.allowSmall and (
		cfg.smallParam and args.small == cfg.smallParam
		or not cfg.smallParam and yesno(args.small)
	)

	-- Add attributes, classes and styles.
	self.id = args.id
	self.name = args.name
	if self.name then
		self:addClass('box-' .. string.gsub(self.name,' ','_'))
	end
	if yesno(args.plainlinks) ~= false then
		self:addClass('plainlinks')
	end
	for _, class in ipairs(cfg.classes or {}) do
		self:addClass(class)
	end
	if self.isSmall then
		self:addClass(cfg.smallClass or 'mbox-small')
	end
	self:addClass(self.typeClass)
	self:addClass(args.class)
	self.style = args.style
	self.attrs = args.attrs

	-- Set text style.
	self.textstyle = args.textstyle
	self.textclass = args.textclass -- Add this line to identify the text's class.

	-- Find if we are on the template page or not.
	self.useCollapsibleTextFields = cfg.useCollapsibleTextFields
	if self.useCollapsibleTextFields
		or cfg.templateCategory
		and cfg.templateCategoryRequireName
	then
		if self.name then
			local templateName = mw.ustring.match(
				self.name,
				'^[tT][eE][mM][pP][lL][aA][tT][eE][%s_]*:[%s_]*(.*)$'
			) or self.name
			templateName = 'Template:' .. templateName
			self.templateTitle = getTitleObject(templateName)
		end
		self.isTemplatePage = self.templateTitle
			and mw.title.equals(self.title, self.templateTitle)
	end
	
	-- Process data for collapsible text fields.
	if self.useCollapsibleTextFields then
		if self.isSmall and args.smalltext then
			self.issue = args.smalltext
		else
			local sect
			if args.sect == '' then
				sect = 'This ' .. (cfg.sectionDefault or 'page')
			elseif type(args.sect) == 'string' then
				sect = 'This ' .. args.sect
			end
			local issue = args.issue
			issue = type(issue) == 'string' and issue ~= '' and issue or nil
			local text = args.text
			text = type(text) == 'string' and text or nil
			local issues = {}
			table.insert(issues, sect)
			table.insert(issues, issue)
			table.insert(issues, text)
			self.issue = table.concat(issues, ' ')
		end

		local talk = args.talk
		if talk == ''
			and self.templateTitle
			and (
				mw.title.equals(self.templateTitle, self.title)
				or self.title:isSubpageOf(self.templateTitle)
			)
		then
			talk = '#'
		elseif talk == '' then
			talk = nil
		end
		if talk then
			local talkTitle = getTitleObject(talk)
			local talkArgIsTalkPage = true
			if not talkTitle or not talkTitle.isTalkPage then
				talkArgIsTalkPage = false
				talkTitle = getTitleObject(
					self.title.text,
					mw.site.namespaces[self.title.namespace].talk.id
				)
			end
			if talkTitle and talkTitle.exists then
				local talkText = 'Relevant discussion may be found on'
				if talkArgIsTalkPage then
					talkText = string.format(
						'%s [[%s|%s]].',
						talkText,
						talk,
						talkTitle.prefixedText
					)
				else
					talkText = string.format(
						'%s the [[%s#%s|talk page]].',
						talkText,
						talkTitle.prefixedText,
						talk
					)
				end
				self.talk = talkText
			end
		end

		self.fix = args.fix ~= '' and args.fix or nil
		local date
		if args.date and args.date ~= '' then
			date = args.date
		elseif args.date == '' and self.isTemplatePage then
			date = lang:formatDate('F Y')
		end
		if date then
			self.date = string.format(" <small class='date-container'>''(<span class='date'>%s</span>)''</small>", date)
		end
		self.info = args.info
	end

	if self.isSmall then
		self.text = args.smalltext or args.text
	else
		self.text = args.text
	end

	self.below = cfg.below and args.below
	self.imageCellDiv = not self.isSmall and cfg.imageCellDiv
	self.imageEmptyCell = cfg.imageEmptyCell
	if cfg.imageEmptyCellStyle then
		self.imageEmptyCellStyle = 'border:none;padding:0px;width:1px'
	end

	local imageLeft = self.isSmall and args.smallimage or args.image
	if cfg.imageCheckBlank and imageLeft ~= 'blank' and imageLeft ~= 'none'
		or not cfg.imageCheckBlank and imageLeft ~= 'none'
	then
		self.imageLeft = imageLeft
		if not imageLeft then
			local imageSize = self.isSmall
				and (cfg.imageSmallSize or '30x30px')
				or '40x40px'
			self.imageLeft = string.format('[[File:%s|%s|link=|alt=icon]]', self.typeImage
				or 'Imbox notice.png', imageSize)
		end
	end

	local imageRight = self.isSmall and args.smallimageright or args.imageright
	if not (cfg.imageRightNone and imageRight == 'none') then
		self.imageRight = imageRight
	end
end

function MessageBox:export(frame)
	local root = mw.html.create()

	-- Create the box table.
	local boxTable = root:tag('table')
	boxTable:attr('id', self.id or nil)
	for i, class in ipairs(self.classes or {}) do
		boxTable:addClass(class or nil)
	end
	boxTable
		:cssText(self.style or nil)
		:attr('role', 'presentation')

	if self.attrs then
		boxTable:attr(self.attrs)
	end

	-- Add the left-hand image.
	local row = boxTable:tag('tr')
	if self.imageLeft then
		local imageLeftCell = row:tag('td'):addClass('mbox-image')
		if self.imageCellDiv then
			imageLeftCell = imageLeftCell:tag('div'):css('width', '52px')
		end
		imageLeftCell:wikitext(self.imageLeft or nil)
	elseif self.imageEmptyCell then
		row:tag('td')
			:addClass('mbox-empty-cell')
			:cssText(self.imageEmptyCellStyle or nil)
	end

	-- Add the text.
	local textCell = row:tag('td'):addClass('mbox-text')
	if self.textclass then
		textCell:addClass(self.textclass) -- Thêm class tùy biến vào td chứa text
	end
	if self.useCollapsibleTextFields then
		textCell:cssText(self.textstyle or nil)
		local textCellDiv = textCell:tag('div')
		textCellDiv
			:addClass('mbox-text-span')
			:wikitext(self.issue or nil)
		if (self.talk or self.fix) and not self.isSmall then
			textCellDiv:tag('span')
				:addClass('hide-when-compact')
				:wikitext(self.talk and (' ' .. self.talk) or nil)
				:wikitext(self.fix and (' ' .. self.fix) or nil)
		end
		textCellDiv:wikitext(self.date and (' ' .. self.date) or nil)
		if self.info and not self.isSmall then
			textCellDiv
				:tag('span')
				:addClass('hide-when-compact')
				:wikitext(self.info and (' ' .. self.info) or nil)
		end
	else
		textCell
			:cssText(self.textstyle or nil)
			:wikitext(self.text or nil)
	end

	-- Add the right-hand image.
	if self.imageRight then
		local imageRightCell = row:tag('td'):addClass('mbox-imageright')
		if self.imageCellDiv then
			imageRightCell = imageRightCell:tag('div'):css('width', '52px')
		end
		imageRightCell
			:wikitext(self.imageRight or nil)
	end

	-- Add the below row.
	if self.below then
		boxTable:tag('tr')
			:tag('td')
				:attr('colspan', self.imageRight and '3' or '2')
				:addClass('mbox-text')
				:cssText(self.textstyle or nil)
				:wikitext(self.below or nil)
	end

	-- Add error message for invalid type parameters.
	if self.invalidTypeError then
		root:tag('div')
			:css('text-align', 'center')
			:wikitext(string.format(
				'This message box is using an invalid "type=%s" parameter and needs fixing.',
				self.type or ''
			))
	end

	-- Tách gọi TemplateStyles tối ưu hiệu suất bằng cách truyền frame
	local currentFrame = frame or mw.getCurrentFrame()
	return tostring(root) .. currentFrame:extensionTag( 'templatestyles', '', { src = 'Module:Message box/styles.css' } )
end

--------------------------------------------------------------------------------
-- Exports
--------------------------------------------------------------------------------

local p, mt = {}, {}

function p._exportClasses()
	return {
		MessageBox = MessageBox
	}
end

function p.main(boxType, args, cfgTables, frame)
	local box = MessageBox.new(boxType, args, cfgTables or mw.loadData(CONFIG_MODULE))
	box:setParameters()
	return box:export(frame)
end

function mt.__index(t, k)
	return function (frame)
		if not getArgs then
			getArgs = require('Module:Arguments').getArgs
		end
		return t.main(k, getArgs(frame, {trim = false, removeBlanks = false}), nil, frame)
	end
end

return setmetatable(p, mt)
