--  __  __          _      _     _ ___ ___             _____       _        
-- |  \/  |___  __| |_  _| |___(_) __/ __|___ _ _    / /   \ __ _| |_ __ _ 
-- | |\/| / _ \/ _` | || | / -_)| (_| (_ / -_) ' \ / /| |) / _` |  _/ _` |
-- |_|  |_\___/\__,_|\_,_|_\___(_)___\___\___|_||_/_/ |___/\__,_|\__\__,_|

local d = {}

-- =========================
-- LICENSES
-- =========================
d.licenses = {
	["pd-flag"] = function(args, lang, msg, cat)
		return msg(lang, "pd-flag"), "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-flag"), "[[File:Diagonal_bicolor_blue_and_orange_flag.svg|64px|link=]]", "commons"
	end,

	["pd-shapes"] = function(args, lang, msg, cat)
		return msg(lang, "pd-shapes"), "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-shapes"), "[[File:Pentagon.svg|64px|link=]]", "commons"
	end,

	["pd-textlogo"] = function(args, lang, msg, cat)
		return msg(lang, "pd-textlogo"), "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-textlogo"), "none", "commons"
	end,

	["pd-author"] = function(args, lang, msg, cat)
		local author = args.ad or args.author or args[2] or ""
		local text = ""

		if author and author ~= "" then
			text = msg(lang, "pd-author-with", author)
		else
			text = msg(lang, "pd-author-self")
		end
		return text, "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-author"), "none", "commons"
	end,

	["pd-ineligible"] = function(args, lang, msg, cat)
		return msg(lang, "pd-ineligible"), "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-ineligible"), "none", "commons"
	end,

	["pd-chart"] = function(args, lang, msg, cat)
		return msg(lang, "pd-chart"), "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-chart"), "none", "commons"
	end,

	["pd-map"] = function(args, lang, msg, cat)
		return msg(lang, "pd-map"), "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-chart"), "none", "commons"
	end,

	["pd-chem"] = function(args, lang, msg, cat)
		return msg(lang, "pd-chem"), "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-chem"), "none", "commons"
	end,

	["pd-text"] = function(args, lang, msg, cat)
		return msg(lang, "pd-text"), "[[File:PD-icon.svg|64px|link=]]", cat(lang, "pd-text"), "none", "commons"
	end,

	["pd-sign"] = function(args, lang, msg, cat)
		return msg(lang, "pd-sign"), "[[File:VzKat.svg|64px|link=]]", cat(lang, "pd-chart"), "none", "commons"
	end,

	["pd-wpdc"] = function(args, lang, msg, cat)
		return msg(lang, "pd-wpdc"), "[[File:ParliamentLogo.svg|64px|link=]]", cat(lang, "pd-chart"), "none", "commons"
	end,

	["cc-by-sa-4.0"] = function(args, lang, msg, cat)
		return msg(lang, "cc-by-sa-4.0"), "[[File:CreativeCommons logo trademark.svg|120px|link=]] [[File:Cc-by new white.svg|30px|link=]] [[File:Cc-sa white.svg|30px|link=]]", cat(lang, "cc-by-sa-4.0"), "none", "license"
	end,

	["cc-by-sa-3.0-vn"] = function(args, lang, msg, cat)
		return msg(lang, "cc-by-sa-3.0-vn"), "[[File:CreativeCommons logo trademark.svg|120px|link=]] [[File:Cc-by new white.svg|30px|link=]] [[File:Cc-sa white.svg|30px|link=]]", cat(lang, "cc-by-sa-4.0"), "[[File:Flag of Vietnam.svg|64px|link=]]", "license"
	end,

	["mit"] = function(args, lang, msg, cat)
		local authorlic = args.ad or args.author or args[2] or msg(lang, "default-authorlic")
		local yearlic = args.ad2 or args.year or args[3] or ""
		return msg(lang, "mit", yearlic, authorlic), "[[File:MIT logo 2003-2023.svg|64px|link=]]", cat(lang, "mit"), "none", "commons"
	end,

	["apache"] = function(args, lang, msg, cat)
		local authorlic = args.ad or args.author or args[2] or msg(lang, "default-authorlic")
		local yearlic = args.ad2 or args.year or args[3] or ""
		return msg(lang, "apache", yearlic, authorlic), "[[File:The ASF Oak Leaf Logo (2025).svg|64px|link=]]", cat(lang, "apache"), "none", "license"
	end,

	["fictitious-flag"] = function(args, lang, msg, cat)
		return msg(lang, "fictitious-flag"), "[[File:Fictional flag (wavy).svg|64px|link=]]", cat(lang, "fictional-flag"), "none", "license"
	end,

	["nazi"] = function(args, lang, msg, cat)
		return msg(lang, "nazi"), "[[File:Under section sign, swastika.svg|64px|link=]]", cat(lang, "nazi"), "none", "license"
	end,

	["naziflag"] = function(args, lang, msg, cat)
		return msg(lang, "naziflag"), "[[File:Under section sign, Nazi Flag.svg|64px|link=]]", cat(lang, "naziflag"), "none", "license"
	end,

	["non-nazi"] = function(args, lang, msg, cat)
		return msg(lang, "non-nazi"), "[[File:Under section sign, non-nazi swastika.svg|65px|link]]", cat(lang, "swastika"), "none", "license"
	end,

	["falungong"] = function(args, lang, msg, cat)
		return msg(lang, "falungong"), "[[File:Under section sign, non-nazi swastika.svg|64px|link=]]", cat(lang, "falungong"), "none", "license"
	end,

	["communist"] = function(args, lang, msg, cat)
		return msg(lang, "communist"), "[[File:Under section sign, hammer and sickle.svg|64px|link=]]", cat(lang, "communist"), "none", "license"
	end,

	["z"] = function(args, lang, msg, cat)
		return msg(lang, "z"), "[[File:Under section sign, Z.svg|64px|link=]]", cat(lang, "russia-militarism"), "none", "license"
	end,

	["teikoku"] = function(args, lang, msg, cat)
		return msg(lang, "teikoku"), "[[File:Under section sign, Rising Sun Flag.svg|64px|link=]]", cat(lang, "japan-empire"), "none", "license"
	end,

	["southvietnam"] = function(args, lang, msg, cat)
		return msg(lang, "southvietnam"), "[[File:Under section sign, South Vietnam.svg|64px|link=]]", cat(lang, "south-vietnam"), "[[File:Flag of Vietnam.svg|64px|link=]]", "license"
	end,

	["vietnamgroup"] = function(args, lang, msg, cat)
		return msg(lang, "vietnamgroup"), "[[File:Icon of Red Warning.svg|64px|link=]]", cat(lang, "vietnam-parties"), "[[File:Flag of Vietnam.svg|64px|link=]]", "license"
	end,

	["israel"] = function(args, lang, msg, cat)
		return msg(lang, "israel"), "[[File:Under section sign, zionism.svg|64px|link=]]", cat(lang, "israel"), "none", "license"
	end,

	["lgbtq"] = function(args, lang, msg, cat)
		return msg(lang, "lgbtq"), "[[File:Under section sign, gay.svg|64px|link=]]", cat(lang, "lgbtq"), "none", "license"
	end,

	["antilgbtq"] = function(args, lang, msg, cat)
		return msg(lang, "antilgbtq"), "[[File:Under section sign, Anti LGBTQ.svg|64px|link=]]", cat(lang, "anti-lgbtq"), "none", "license"
	end,

	["apartheid"] = function(args, lang, msg, cat)
		return msg(lang, "apartheid"), "[[File:Under section sign, Apartheid.svg|64px|link=]]", cat(lang, "apartheid"), "[[File:Flag of South Africa.svg|64px|link=]]", "license"
	end,

	["ai"] = function(args, lang, msg, cat)
		return msg(lang, "ai"), "[[File:Icon of Warning.svg|64px|link=]]", cat(lang, "ai"), "none", "license"
	end
}

-- =========================
-- ALIASES
-- =========================
d.licenseAliases = {
	flag = "pd-flag", vexillology = "pd-flag", vexillological = "pd-flag",
	["pd-shape"] = "pd-shapes", shape = "pd-shapes", shapes = "pd-shapes", geometry = "pd-shapes",
	textlogo = "pd-textlogo",
	["pd-self"] = "pd-author", author = "pd-author",
	["in"] = "pd-ineligible", ine = "pd-ineligible", ineligible = "pd-ineligible",
	["fiction flag"] = "fictitious-flag", ["fiction-flag"] = "fictitious-flag",
	["fictional flag"] = "fictitious-flag", ["fictional-flag"] = "fictitious-flag",
	nazism = "nazi", hitler = "nazi",
	nordic = "naziflag", aeca = "naziflag",
	swastika = "non-nazi", nonnazi = "non-nazi",
	["falun gong"] = "falungong", ["falun"] = "falungong", ["china"] = "falungong",
	commie = "communist", socialism = "communist",
	rz = "z", russia = "z", militarism = "z",
	japan = "teikoku", ["japan empire"] = "teikoku", ["risingsun"] = "teikoku", ["risingsunflag"] = "teikoku",
	cali = "southvietnam", cail = "southvietnam", ["3que"] = "southvietnam", ["3 que"] = "southvietnam", ["south vietnam"] = "southvietnam", ["south_vietnam"] = "southvietnam",
	viettan = "vietnamgroup", fulro = "vietnamgroup", dega = "vietnamgroup", vietnamgroups = "vietnamgroup",
	israeli = "israel", zionism = "israel",
	lgbt = "lgbtq", gay = "lgbtq",
	antilgbt = "antilgbtq", ["anti-lgbt"] = "antilgbtq", ["anti-lgbtq"] = "antilgbtq", ["anti lgbt"] = "antilgbtq", ["anti lgbtq"] = "antilgbtq",
	southafrica = "apartheid", ["south africa"] = "apartheid",
}

-- =========================
-- TYPES & CLASSES
-- =========================
d.divTypes = { self = true, screenshot = true, art = true }
d.typeAliases = { own = "self", screen = "screenshot", ["pd-arts"] = "art", ["pd-art"] = "art", arts = "art" }
d.typeClasses = { self = "cgen-wrapper", screenshot = "cgen-wrapper--screenshot", art = "cgen-wrapper--art" }

return d
