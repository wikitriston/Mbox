-- ___  ___         _       _       _____ _____            
-- |  \/  |         | |     | |     _/  __ \  __ \           
-- | .  . | ___   __| |_   _| | ___(_) /  \/ |  \/ ___ _ __  
-- | |\/| |/ _ \ / _` | | | | |/ _ \ | |   | | __ / _ \ '_ \ 
-- | |  | | (_) | (_| | |_| | |  __/_| \__/\ |_\ \  __/ | | |
-- \_|  |_/\___/ \__,_|\__,_|_|\___(_)\____/\____/\___|_| |_|
                                                         
-- Author: [[User:NgocThaoNguyenhi]] • Based on workflow by WikiTriston (https://wikitriston.miraheze.org)
-- MIT License ^•_•^

local p = {}

local getArgs = require("Module:Arguments").getArgs
local yesno = require("Module:Yesno")

local d = require("Module:CGen/data")
local I18n = require("Module:CGen/I18n")

-- =========================
-- DATA
-- =========================

local licenses = d.licenses
local licenseAliases = d.licenseAliases

local divTypes = d.divTypes
local typeAliases = d.typeAliases
local typeClasses = d.typeClasses

-- =========================
-- I18N HELPERS (XỬ LÝ ĐA NGÔN NGỮ)
-- =========================

-- Lấy ngôn ngữ: Ưu tiên tham số truyền vào (nếu có), nếu không có sẽ lấy ngôn ngữ mặc định của Wiki (vi.wiki luôn là "vi")
local function getLang(args)
	return
		args.lang
		or args.uselang
		or mw.language.getContentLanguage():getCode()
		or "vi"
end

local function getMessages(lang)
	return I18n[lang] or I18n.en
end

-- Dịch văn bản thông báo mbox/lỗi theo ngôn ngữ
local function msg(lang, key, ...)
	local messages = getMessages(lang)

	local text =
		messages.messages
		and messages.messages[key]

	if not text then
		text =
			I18n.en.messages
			and I18n.en.messages[key]
	end

	text = text or key

	local argsTbl = {...}

	for i, v in ipairs(argsTbl) do
		text = text:gsub("%$" .. i, tostring(v))
	end

	return text
end

-- Dịch Thể loại (Category)
local function category(lang, key)
	-- Thể loại luôn chạy theo ngôn ngữ mặc định của Wiki để tránh sai sót hệ thống phân loại
	local contentLang = mw.language.getContentLanguage():getCode()
	local messages = getMessages(contentLang)

	local cat =
		messages.categories
		and messages.categories[key]

	if not cat then
		cat =
			I18n.en.categories
			and I18n.en.categories[key]
	end

	return cat or ""
end

-- Dịch phần Header (Dành cho Div mode)
local function header(lang, key, ...)
	local messages = getMessages(lang)

	local text =
		messages.headers
		and messages.headers[key]

	if not text then
		text =
			I18n.en.headers
			and I18n.en.headers[key]
	end

	text = text or ""

	local argsTbl = {...}

	for i, v in ipairs(argsTbl) do
		text = text:gsub("%$" .. i, tostring(v))
	end

	return text
end

-- Dịch phần Footer (Dành cho Div mode)
local function footer(lang, key, ...)
	local messages = getMessages(lang)

	local text =
		messages.footers
		and messages.footers[key]

	if not text then
		text =
			I18n.en.footers
			and I18n.en.footers[key]
	end

	text = text or ""

	local argsTbl = {...}

	for i, v in ipairs(argsTbl) do
		text = text:gsub("%$" .. i, tostring(v))
	end

	return text
end

-- =========================
-- HELPERS
-- =========================

local function normalize(value, aliasMap)
	if not value then
		return nil
	end

	value = mw.text.trim(tostring(value)):lower()

	return aliasMap[value] or value
end

local function renderError(lang, key, ...)
	return string.format(
		'<span class="cgen-error">%s</span>',
		msg(lang, key, ...)
	)
end

-- =========================
-- RENDERING FUNCTIONS (XUẤT GIAO DIỆN)
-- =========================

local function renderMbox(
	frame,
	lang,
	text,
	image,
	imageright,
	cat,
	boxType,
	catEnabled
)
	local args = {
		namespace = "imbox",
		type = boxType or "license",
		text = text,
		image = image,
	}

	if imageright and imageright ~= "" and imageright ~= "none" then
		args.imageright = imageright
	end

	local box = frame:expandTemplate{
		title = "Mbox",
		args = args
	}

	if catEnabled and cat and mw.text.trim(cat) ~= "" then
		box = box .. cat
	end

	return box
end

local function renderDiv(
	frame,
	lang,
	typ,
	author,
	year,
	body,
	class
)
	local headerText = header(lang, typ, author, year)
	local footerText = footer(lang, typ, author, year)

	return string.format([[
<div class="%s">
	<div class="cgen-header">%s</div>
	%s
	<div class="cgen-footer">%s</div>
</div>
]],
		class,
		frame:preprocess(headerText),
		frame:preprocess(body),
		frame:preprocess(footerText)
	)
end

-- =========================
-- MAIN METHOD
-- =========================

function p.main(frame)
	local args = getArgs(frame, {
		parentFirst = true,
		trim = true,
		removeBlanks = true
	})

	-- Lấy ngôn ngữ (hiện tại sẽ luôn chốt là "vi" trên Wikipedia tiếng Việt nếu không có biến args.lang ép buộc)
	local lang = getLang(args)

	local catEnabled =
		yesno(args.cat or args.category or "true")

	local styles = frame:extensionTag(
		"templatestyles",
		"",
		{
			src = "Module:CGen/styles.css"
		}
	)

	if not args.type and not args[1] then
		return styles ..
			renderError(lang, "error-missing-parameters")
	end

	local typ = normalize(args.type, typeAliases)
	local startIndex = 1

	if not typ and args[1] then
		local first = normalize(args[1], typeAliases)

		if divTypes[first] then
			typ = first
			startIndex = 2
		end
	end

	local isDivMode = divTypes[typ] or false

	local author = args.author or ""
	local year = args.year or ""

	local list = {}

	if not isDivMode then
		for i = startIndex, 10 do
			if args[i] then
				local key =
					normalize(args[i], licenseAliases)

				if licenses[key] then
					table.insert(list, key)
				else
					break
				end
			end
		end

		if #list == 0 then
			return styles ..
				renderError(lang, "error-no-license")
		end
	end

	local content = ""

	if isDivMode then
		local body = args.extra or ""

		if (typ == "self" or typ == "screenshot")
			and body == ""
		then
			body = renderError(
				lang,
				"error-extra-missing"
			)
		end

		content = renderDiv(
			frame,
			lang,
			typ,
			author,
			year,
			body,
			typeClasses[typ] or "cgen-wrapper"
		)

	else
		local blocks = {}

		for _, key in ipairs(list) do
			local text,
                  image,
                  cat,
                  imageright,
                  boxType =
		licenses[key](args, lang, msg, category)

			if not cat or cat == "" then
				cat = category(lang, key)
			end

			table.insert(
				blocks,
				renderMbox(
					frame,
					lang,
					text,
					image,
					imageright,
					cat,
					boxType,
					catEnabled
				)
			)
		end

		content = table.concat(blocks, "\n")
	end

	return styles .. content
end

return p

