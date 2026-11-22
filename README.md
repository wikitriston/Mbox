# Mbox

A MediaWiki message box Lua module suite forked from **Miraheze Dev** and extended for **WikiTriston** — featuring multilingual alias mapping, a unified `namespace` parameter, custom `textclass` support, and full Dark Mode styling via TemplateStyles.

## Key Features

- **Full message box family:** Supports `ambox` (articles), `imbox` (files/images), `cmbox` (categories), `ombox` (other pages), `tmbox` (talk pages), `fmbox` (header/footer notices), plus `mbox` / `main` (automatic namespace detection).
- **Centralized `/data` configuration:** All `types`, `aliases`, and `namespaces` tables live in `Module:Message box/data` and are loaded with `mw.loadData` for optimal performance.
- **Multilingual aliases (English & Vietnamese):** Both `type` and `namespace` accept English and Vietnamese aliases with UTF-8 case-insensitive matching and automatic whitespace trimming.
- **Flexible `namespace` parameter:** Introduces `namespace` (with `ns` shorthand) as the primary namespace override while keeping full backward compatibility with `demospace`.
- **Custom text cell styling (`textclass`):** Adds custom CSS classes directly to the message body cell (`td.mbox-text`) and the `below` row.
- **Built-in Dark Mode:** Tinted dark surfaces matching each box type, supporting both manual dark mode (`skin-theme-clientpref-night`) and automatic OS dark mode (`skin-theme-clientpref-os` with `prefers-color-scheme: dark`).

## File Structure & Installation

### MediaWiki Requirements

- **Scribunto** (Lua) and **TemplateStyles** extensions.
- Dependent modules: `Module:Arguments` and `Module:Yesno`.

### Mapping Files to Your Wiki

| Repository File | Target MediaWiki Page | Notes |
| :--- | :--- | :--- |
| `mbox.lua` | `Module:Message box` | Main Lua module |
| `mbox data.lua` | `Module:Message box/data` | Configuration data (`namespaces`, `types`, `aliases`) |
| `mbox styles.css` | `Module:Message box/styles.css` | Save with content model `Sanitized CSS` |

## Usage

### From Wikitext

Auto-detect the box style based on the current namespace (using `mbox` or `main`):

```wikitext
{{#invoke:Message box|mbox
| type = notice
| text = This is a message box.
}}
```

Or invoke `main` directly and override the namespace with `namespace` / `ns` (English or Vietnamese aliases):

```wikitext
{{#invoke:Message box|main
| namespace = article
| type = speedy
| text = This page is nominated for speedy deletion.
}}
```

Invoke a specific box type directly (e.g., `ambox` with collapsible fields and `textclass`):

```wikitext
{{#invoke:Message box|ambox
| type = content
| issue = This article needs additional citations for verification.
| fix = Please help improve this article by adding reliable sources.
| date = November 2026
| textclass = custom-mbox-text
}}
```

### From Another Lua Module

```lua
local mbox = require('Module:Message box')
return mbox.main('ambox', {
	type = 'notice',
	text = 'Notice generated from a Lua module.'
})
```

## Parameters

| Parameter | Applies To | Description |
| :--- | :--- | :--- |
| `type` | All | Box type (supports English and Vietnamese aliases defined in `/data`). |
| `text` | All | Main message body text. |
| `namespace` / `ns` | `mbox`, `main` | Overrides namespace detection (e.g., `main`, `article`, `category`, `file`, `talk`, Vietnamese equivalents, or a direct box name like `ambox`). |
| `demospace` | `mbox`, `main` | Backward-compatible alias for `namespace`. |
| `image` | All | Custom left image; set `none` to hide (or `blank` on `ambox`). |
| `imageright` | All | Custom right image; set `none` to hide on box types with `imageRightNone`. |
| `small` | `ambox`, `ombox`, `tmbox` | Compact layout (`left` for `ambox`; `yes`/`true` for `ombox` and `tmbox`). |
| `smallimage` / `smallimageright` / `smalltext` | Boxes supporting `small` | Alternate left image, right image, and text when rendered in compact mode. |
| `style` / `textstyle` | All | Inline CSS for the table or message text cell. |
| `class` / `textclass` | All | Extra CSS classes for the table or `td.mbox-text` cell. |
| `id` / `name` | All | HTML `id` attribute and template name (automatically adds `box-<name>` class). |
| `plainlinks` | All | Enables the `plainlinks` class by default; set `no` to disable. |
| `below` | `imbox` | Additional full-width row below the main message row. |
| `page` | All | Simulates another page title for namespace and talk-page resolution. |
| `sect` / `issue` / `fix` / `talk` / `date` / `info` | `ambox` | Collapsible text fields (`useCollapsibleTextFields`). |
| `attrs` | Lua only | Lua table of extra HTML attributes applied to the `<table>` element. |

## Namespace Mapping (`namespaces`)

The `namespaces` table in `Module:Message box/data` maps `namespace` / `ns` / `demospace` values to their target box configurations:

| Target Box | English Values | Vietnamese Aliases |
| :--- | :--- | :--- |
| `ambox` | `main`, `article` | `chính`, `bài viết` |
| `tmbox` | `talk` (or any string containing `talk`) | `thảo luận` (or any string containing `thảo luận`) |
| `imbox` | `file`, `image` | `tập tin`, `tệp`, `hình`, `hình ảnh` |
| `cmbox` | `category`, `cat` | `thể loại` |
| `ombox` | `other`, `user`, `project`, `template`, `help` | `khác`, `thành viên`, `dự án`, `bản mẫu`, `trợ giúp` |

## Supported Box Types (`type`)

- **Standard boxes (`ambox`, `cmbox`, `ombox`, `tmbox`):** `speedy`, `delete`, `content`, `style`, `move`, `protection`, `notice` (default).
- **File boxes (`imbox`):** also includes `warn`, `license`, `commons`, `featured`.
- **Header/footer boxes (`fmbox`):** `warning`, `editnotice`, `system` (default).

Each box family defines its own `aliases` table in `Module:Message box/data` (e.g., `speed`/`err`/`khẩn cấp`/`xóa nhanh` → `speedy`, `warn`/`warning`/`xóa` → `delete`, `info`/`thông báo` → `notice`, `merge`/`di chuyển`/`gộp` → `move`, `protect`/`khóa`/`bảo vệ` → `protection`, `lic`/`bản quyền`/`giấy phép` → `license`).

## License

Licensed under the **GNU General Public License v2.0 (GPL-2.0)**.
