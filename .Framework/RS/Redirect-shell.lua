local p = {}
local data = mw.loadData('Module:RS/data')

-- ==========================================
-- CONSTANTS & CẤU HÌNH (Dễ dàng tách ra i18n)
-- ==========================================

local HEADERS = {
    hard = "<b>This page is a [[WP:Redirect|redirect]]. The following categories are used to track and monitor this redirect:</b>",
    soft = "<b>This page is a [[WP:Soft redirect|soft redirect]].</b>",
    add  = "<b>The following categories are added to this redirect:</b>",
    -- Có thể thêm dễ dàng:
    -- inline = "...",
    -- plain = ""
}

local CATEGORIES = {
    hard = "[[Category:Redirects]]",
    soft = "[[Category:Soft redirects]]",
    add  = "[[Category:Miscellaneous redirects]]"
}

-- Bảng tra cứu mode (nhanh hơn if-elseif)
local MODES = {
    soft = true,
    add = true,
    inline = true,
    plain = true,
    json = true
}

-- ==========================================
-- HÀM HỖ TRỢ
-- ==========================================

local function getRedirectInfo(inputKey)
    if not inputKey or inputKey == "" then 
        return nil 
    end
    
    local normalizedKey = mw.text.trim(inputKey):lower()
    
    if data.rid[normalizedKey] then
        return data.rid[normalizedKey]
    end
    
    local targetKey = data.aliases[normalizedKey]
    if targetKey and data.rid[targetKey] then
        return data.rid[targetKey]
    end
    
    return nil
end

-- ==========================================
-- HÀM CHÍNH (XỬ LÝ & RENDER)
-- ==========================================

function p.main(frame)
    local args = frame:getParent().args
    if not args[1] then args = frame.args end
    
    local arg1 = mw.text.trim(args[1] or "")
    local mode, rawKey, extraText
    
    -- Phân loại Mode
    if MODES[arg1] then
        mode = arg1
        rawKey = mw.text.trim(args[2] or "")
        extraText = mw.text.trim(args[3] or "")
    else
        mode = "hard"
        rawKey = arg1
        extraText = mw.text.trim(args[2] or "")
    end
    
    -- KIỂM TRA CHẶN LỖI THAM SỐ RỖNG
    if rawKey == "" then
        -- Cách 1: Trả về chuỗi rỗng (thường dùng để module fail silently khi bị truyền tham số trống)
        return "" 
        
        -- Cách 2: Hoặc nếu bạn muốn hiện cảnh báo rõ ràng hơn, hãy dùng dòng này thay vì return ""
        -- return '<strong class="error">Lỗi: Vui lòng nhập tên loại đổi hướng.</strong>[[Category:Pages with missing redirect data]]'
    end
    
    -- Lấy dữ liệu
    local info = getRedirectInfo(rawKey)
    if not info then
        return string.format('<strong class="error">Lỗi: Không tìm thấy loại đổi hướng "%s"</strong>[[Category:Pages with missing redirect data]]', rawKey)
    end
    
    -- Build HTML bằng table.concat
    local html = {}
    
    -- Mở container với CSS Variables
    table.insert(html, '<div id="rid-shell" style="border: 3px solid var(--border-color-progressive--hover); border-left: 10px solid var(--border-color-progressive--hover); background-color: var(--background-color-neutral-subtle); padding: 1em; margin-top: 0.5em;">')
    
    -- Header không hard-code
    local currentHeader = HEADERS[mode] or HEADERS.hard
    if currentHeader ~= "" then
        table.insert(html, string.format('<p>%s</p>', currentHeader))
    end
    
    -- Nội dung chính
    table.insert(html, string.format("<ul>\n<li><b>%s:</b> %s", info.title, info.desc))
    
    -- Render các bullets nếu có
    if info.bullets then
        table.insert(html, "\n<ul>")
        for _, bullet in ipairs(info.bullets) do
            table.insert(html, string.format("\n<li>%s</li>", bullet))
        end
        table.insert(html, "\n</ul>")
    end
    
    table.insert(html, "</li>\n</ul>")
    
    -- Render extra text nếu có
    if extraText and extraText ~= "" then
        table.insert(html, string.format('<p id="rid-extra" class="redirect-extra">%s</p>', extraText))
    end
    
    -- Category
    table.insert(html, CATEGORIES[mode] or CATEGORIES.hard)
    
    -- Đóng container
    table.insert(html, '</div>')
    
    -- Gộp chuỗi 1 lần duy nhất
    return table.concat(html)
end

return p
