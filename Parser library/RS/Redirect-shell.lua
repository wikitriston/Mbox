local p = {}  
local getArgs = require('Module:Arguments').getArgs
local mbox = require('Module:Message box') -- Nạp mbox trực tiếp

-- Nạp dữ liệu tĩnh từ module con
local dataSource = mw.loadData('Module:RS/data')
local rid = dataSource.rid
local aliases = dataSource.aliases

-- =========================  
-- HELPER: HTML BUILDER  
-- =========================  
local function buildHtml(data)
    if not data then return "" end
    
    local html = string.format("<ul><li><b>%s:</b> %s</li>", data.title, data.desc)
    
    if data.bullets and #data.bullets > 0 then
        html = html .. "<ul>"
        for _, bullet in ipairs(data.bullets) do
            html = html .. "<li>" .. bullet .. "</li>"
        end
        html = html .. "</ul>"
    end
    
    html = html .. "</ul>"
    return html
end

-- =========================  
-- MAIN FUNCTION  
-- =========================  
function p.main(frame)  
    local args = getArgs(frame)  
    
    local mode, rawKey, extraText
    local arg1 = (args[1] or ""):lower()
    
    -- Phân loại tham số đầu vào
    if arg1 == "soft" or arg1 == "add" then
        mode = arg1
        rawKey = args[2] or ""
        extraText = args[3] or ""
    else
        mode = "hard"
        rawKey = args[1] or ""
        extraText = args[2] or ""
    end
  
    -- Chuẩn hóa key
    local key = rawKey:lower()  
    key = aliases[key] or key  
  
    -- Tạo text từ data
    local text = buildHtml(rid[key])

    -- Xử lý fallback cho văn bản hiển thị
    if text == "" then
        text = extraText ~= "" and extraText or "No redirect information available."
    elseif extraText ~= "" then
        text = text .. " " .. extraText
    end

    -- Nếu chế độ là "add", chỉ trả về chuỗi text thô (không cần nạp CSS hay mbox)
    if mode == "add" then
        return text
    end

    -- Thiết lập nội dung & thể loại mặc định
    local mboxText = ""
    local defaultCat = "[[Category:Redirects]]"
    
    if mode == "soft" then
        defaultCat = "[[Category:Soft redirects]]"
        mboxText = "<b>This page is a [[WP:Soft redirect|soft redirect]].</b><br/>" .. text
    else
        mboxText = "<b>This page is a [[WP:Redirect|redirect]]. The following [[:Category: Redirects|categories]] below describe the purpose of this redirect:</b><br/>" .. text .. "<small><i>When applicable, page protection levels are automatically detected and placed into the appropriate maintenance categories.</i></small>"
    end

    -- =========================  
    -- NẠP CSS & DỰNG MBOX  
    -- =========================  
    -- Gọi ExtensionTag để nạp stylesheet của bạn
    local templatestyles = frame:extensionTag( 'templatestyles', '', { src = 'Module:RS/styles.css' } )
    
    -- Tạo mbox sử dụng class thay vì style inline
    local box = mbox.main('mbox', {  
        demospace = 'main',
        type = "move",  
        text = mboxText,  
        class = "rs-mbox",
        textclass = "rs-mbox-text",  
        image = "[[File:UK traffic sign 609 (right).svg|70px|link=]]",  
        cat = defaultCat  
    }, nil, frame)
    
    -- Ghép mã CSS đính kèm vào trước mbox để hệ thống render đồng thời
    return templatestyles .. box
    
end  
  
return p
