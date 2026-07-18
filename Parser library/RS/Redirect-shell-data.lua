local data = {
    rid = {},
    aliases = {}
}

-- =========================
-- RID DATA
-- =========================
-- Mỗi mục gồm:
-- title   : tên hiển thị
-- desc    : mô tả ngắn
-- bullets : các gạch đầu dòng giải thích thêm
-- aliases : các tên gọi thay thế sẽ trỏ về key này
-- legacy  : các tên cũ hoặc tên rcat cũ nếu muốn giữ tương thích
data.rid = {

    abbreviation = {
        title = "From or to an abbreviation",
        desc = "This redirect is between an abbreviated and expanded form of the same name, title, phrase, or term.",
        bullets = {
            "This includes abbreviations, acronyms (pronounced as words, such as NATO), initialisms (letters pronounced individually, such as UN), and numeronyms (abbreviations containing numbers, such as B2B or K9).",
            "These redirects improve navigation and searchability by helping readers locate the intended page regardless of whether a shortened or expanded form is used. They may also be used when the abbreviated form is the preferred or more commonly recognized title. In most cases, existing links to these redirects do not need to be updated."
        },
        aliases = { "acronym", "initialism", "numeronym", "abbr" },
        legacy = { "r-abbreviation" }
    },

    alternative = {
        title = "From an alternative name",
        desc = "This redirect points from an alternative or commonly recognized name to the target page.",
        bullets = {
            "It exists to improve navigation and searchability. Redirects of this type normally do not require their incoming links to be changed.",
            "Redirects created from incorrect names should instead use the From an incorrect name redirect category."
        },
        aliases = { "alt-name", "alternative-name", "common-name" }
    },

    ["alternative-form"] = {
        title = "From an alternative form",
        desc = "This redirect is from an alternative form of the target title, including differences in spelling, hyphenation, punctuation, spacing, or transliteration.",
        bullets = {
            "These redirects help readers locate the intended page using commonly encountered title variations. They improve navigation and searchability while preserving access through different writing conventions.",
            "Links to these redirects generally do not need to be updated unless doing so improves the clarity or quality of the surrounding text.",
            "More specific redirect categories may be used when the variation belongs to a particular type, such as alternative spelling, hyphenation, punctuation, spacing, or transliteration."
        },
        aliases = {
            "spelling", "alternative spelling", "alternative_spelling", "alternative-spelling",
            "hyphenation", "alternative hyphenation", "alternative_hyphenation", "alternative-hyphenation",
            "punctuation", "alternative punctuation", "alternative_punctuation", "alternative-punctuation",
            "spacing", "alternative spacing", "alternative_spacing", "alternative-spacing",
            "transliteration", "alternative transliteration", "alternative_transliteration", "alternative-transliteration"
        }
    },

    ["american-english"] = {
        title = "From American English",
        desc = "This redirect is from a title using American English spelling to the preferred spelling used by the target page.",
        bullets = {
            "It helps readers find the intended page regardless of regional spelling differences. This redirect is considered a specific type of alternative spelling and does not require an additional From an alternative spelling redirect category."
        },
        aliases = { "american english", "american_english" }
    },

    ascii = {
        title = "From an ASCII-only title",
        desc = "This redirect is from a title that uses only basic ASCII characters to a preferred title containing one or more non-ASCII characters or symbols.",
        bullets = {
            "It helps readers locate the intended page when an ASCII-only form is used for searching, typing, or compatibility with systems that do not support extended characters.",
            "This redirect applies only to differences involving non-ASCII characters other than diacritics or ligatures. Those cases should use the appropriate redirect categories instead."
        },
        aliases = { "ascii-only", "ascii only", "ascii-title" }
    },

    ["british-english"] = {
        title = "From British English",
        desc = "This redirect is from a title using British English spelling to the preferred spelling used by the target page.",
        bullets = {
            "It helps readers find the intended page regardless of regional spelling differences. This redirect is considered a specific type of alternative spelling and does not require an additional From an alternative spelling redirect category."
        },
        aliases = { "british english", "british_english" }
    },

    capitalisation = {
        title = "From a capitalisation variant",
        desc = "This redirect is from a title that differs only in capitalisation. It may represent either an incorrect capitalisation or an alternative, valid capitalisation that redirects to the preferred title.",
        bullets = {
            "Redirects of this type improve navigation, searchability, and consistency by allowing readers to find the intended page regardless of capitalisation differences.",
            "If the redirect is based on an incorrect capitalisation, editors should, where practical, update links to point directly to the correctly capitalised title.",
            "If the redirect represents another accepted method of capitalisation rather than an error, existing links generally do not need to be changed."
        },
        aliases = { "other capitalisation", "other-capitalisation", "miscapitalisation" }
    },

    category = {
        title = "From category navigation",
        desc = "This redirect is from a category used for navigational purposes to the appropriate target category.",
        bullets = {
            "It is intended to assist category navigation through category navigation templates or other organizational structures.",
            "These redirects help readers and editors locate the appropriate category while avoiding duplicate or unnecessary category pages.",
            "Category navigation redirects are maintenance pages and generally should not be removed or converted into normal categories unless there is a demonstrated need."
        },
        aliases = { "category-navigation", "category-nav" }
    },

    completeness = {
        title = "From a completeness variant",
        desc = "This redirect is from a title that differs only in how complete it is, including shorter, longer, or incomplete forms of the preferred title.",
        bullets = {
            "These redirects help readers find the intended page regardless of whether they search using a shortened, expanded, or partially complete name.",
            "Examples include abbreviated personal names, shortened work titles, complete official names, and incomplete forms that omit distinguishing information.",
            "Links from incomplete names should normally be updated when practical, while links from acceptable short or long forms generally do not require replacement."
        },
        aliases = { "short", "long", "incomplete" }
    },

    creative = {
        title = "From or related to a creative work",
        desc = "This redirect is from a creative work, a creator, or another work-related title to a related topic, such as the work itself, its creator, publisher, production company, series, or another associated subject.",
        bullets = {
            "Creative works include books, films, television programs, radio programs, songs, albums, journals, quotations, slogans, comics, internet memes, and other artistic, literary, or entertainment works.",
            "These redirects improve navigation by allowing readers to locate related topics when an individual work, creator, or associated subject does not have its own standalone article.",
            "Some redirects may represent works that could eventually merit their own articles when sufficient independent coverage becomes available.",
            "More specific redirect categories may be used for particular types of creative works, such as books, films, songs, albums, journals, comics, radio programs, creators, or other media."
        },
        aliases = {
            "creative-work",
            "creative",
            "work",

            "book",
            "film",
            "movie",
            "television",
            "tv",
            "episode",
            "radio-program",
            "broadcast",
            "journal",
            "song",
            "cover-song",
            "album",
            "quotation",
            "quote",
            "slogan",
            "comic",
            "comics",
            "meme",

            "creator",
            "author",
            "writer",
            "artist",
            "director",
            "producer",

            "broadcast-translator",
            "upcoming-film",
            "naming-convention-comics"
        }
    },
	subreddit = {
    	title = "From a subreddit",
    	desc = "This redirect is from the name of a subreddit to the article about the subject discussed by that subreddit.",
    	bullets = {
        	"These redirects improve navigation by allowing readers to reach the corresponding topic directly from a subreddit name.",
        	"Redirect titles should normally begin with <code>r/</code> or <code>/r/</code>.",
        	"The redirect should target the article about the subject of the subreddit rather than the subreddit itself."
    	},
    	aliases = {
        	"reddit",
        	"reddit-community",
        	"reddit-community-name",
        	"sub",
        	"subreddit-name",
        	"r"
    	}
	},
	music = {
    	title = "From or related to music",
    	desc = "This redirect is from a musical work, recording, performer, or another music-related topic to a related page.",
    	bullets = {
        	"Music-related redirects include albums, EPs, songs, lyrics, cover versions, remixes, bands, musicians, recordings, and other musical subjects.",
        	"These redirects improve navigation by allowing readers to locate the appropriate article even when the individual work or performer does not have a standalone page.",
        	"More specific redirect categories should be used whenever possible."
    },
    	aliases = {
        	"music",

        -- Works
        	"album",
        	"ep",
        	"song",
        	"lyrics",
        	"lyric",
	        "cover-song",
	        "cover-version",
	        "remix",

        -- Artists
	        "band",
	        "band-name",
	        "group",
	        "music-group",
	        "musician",
	        "artist",

        -- Other
	        "single",
	        "track",
        	"recording"
    	}
	},
	television = {
	    title = "From or related to television",
	    desc = "This redirect is from a television-related title, including television programs, television series, web series, episodes, seasons, specials, or other related topics.",
	    bullets = {
	        "These redirects improve navigation by helping readers locate television-related topics even when individual programs, episodes, seasons, or specials do not have standalone articles.",
	        "Redirect targets may include a television series, a list of episodes, a section within an article, or another related page.",
	        "More specific redirect categories should be used whenever applicable."
	    },
	    aliases = {
	        -- General
	        "television",
	        "tv",
	        "tv-series",
	        "television-series",
	        "television-program",
	        "tv-program",
	        "web-series",
	
	        -- Episodes
	        "episode",
	        "television-episode",
	        "tv-episode",
	        "radio-episode",
	
	        -- Others
	        "season",
	        "special",
	        "pilot"
	    }
	},
	internet = {
	    title = "From an Internet identifier",
	    desc = "This redirect is from an Internet identifier, such as a URL, domain name, website address, or other online resource identifier, to the corresponding article or related topic.",
	    bullets = {
	        "These redirects improve navigation by allowing readers to locate a topic using its Internet address or online identifier.",
	        "Examples include URLs, domain names, website addresses, and other identifiers commonly associated with online services.",
	        "Where practical, links in articles should normally use the official name of the subject rather than its URL or domain name."
	    },
	    aliases = {
	        -- General
	        "internet",
	        "web",
	
	        -- URL
	        "url",
	        "uri",
	        "website-url",
	        "web-address",
	
	        -- Domain
	        "domain",
	        "domain-name",
	        "hostname",
	        "fqdn",
	
	        -- Website
	        "website",
	        "site",
	        "web-site"
	    }
	},
	organization = {
	    title = "From or related to an organization",
	    desc = "This redirect is from an organization, company, subsidiary, division, brand, institution, or another organizational entity to a related topic.",
	    bullets = {
	        "These redirects improve navigation by helping readers locate the parent organization, related entity, or broader topic.",
	        "Examples include subsidiaries, divisions, brands, merged organizations, former organizations, and other organizational relationships.",
	        "If the redirected organization later becomes independently notable, the redirect may be replaced with a standalone article."
	    },
	    aliases = {
	        -- General
	        "organization",
	        "organisation",
	        "company",
	        "business",
	        "institution",
	
	        -- Relationships
	        "subsidiary",
	        "division",
	        "branch",
	        "affiliate",
	        "brand",
	        "holding",
	        "parent-company",
	
	        -- Historical
	        "former-company",
	        "merged-company",
	        "acquired-company"
	    }
	},
	maintenance = {
	    title = "Maintenance redirect",
	    desc = "This redirect has a maintenance-related purpose, such as page protection, high transclusion, template-generated categories, or other technical maintenance functions.",
	    bullets = {
	        "Maintenance redirects help preserve the stability, integrity, and organization of the wiki.",
	        "Some maintenance redirects are automatically protected or monitored because they are widely used or technically significant.",
	        "Links to these redirects generally should not be changed unless there is a clear maintenance reason to do so.",
	        "More specific maintenance redirect categories should be used whenever applicable."
	    },
	    aliases = {
	        -- Protection
	        "protected",
	        "fully-protected",
	        "semi-protected",
	        "extended-confirmed",
	        "template-protected",
	
	        -- High use
	        "high-use",
	        "high-use-template",
	
	        -- Template generated
	        "template-generated-category",
	
	        -- Misc
	        "maintenance"
	    }
	},
    disambiguation = {
        title = "From or to a disambiguation title",
        desc = "This redirect is between an ambiguous title, a disambiguation title, or another title used to distinguish between topics with similar names.",
        bullets = {
            "These redirects improve navigation by guiding readers from ambiguous, qualified, incomplete, predictable, or alternative disambiguation titles to the appropriate article or disambiguation page.",
            "Variants may include ambiguous titles, pages ending with a disambiguation qualifier, incomplete or alternative qualifiers, predictable disambiguation forms, or qualifiers that are currently unnecessary.",
            "Redirects to disambiguation pages should normally be used only for titles that explicitly identify themselves as disambiguation pages, while ambiguous titles without such qualifiers should instead redirect using the appropriate ambiguous-title convention.",
            "If the redirect represents an incorrect, incomplete, or unnecessary disambiguation qualifier, editors should use the more specific redirect category whenever appropriate.",
            "Links to these redirects generally do not require replacement unless a more direct or more appropriate target becomes available."
        },
        aliases = {
            "ambiguous",
            "ambiguous-term",
            "to-disambiguation",
            "disambiguation-page",
            "other-disambiguation",
            "predictable-disambiguation",
            "incomplete-disambiguation",
            "unnecessary-disambiguation"
        }
    },

    draft = {
        title = "From a draft",
        desc = "This redirect is from a draft version of a page, including drafts created in the draft namespace, userspace, or another non-content workspace, to the corresponding published page.",
        bullets = {
            "These redirects help editors and readers locate the published page from an earlier draft or unpublished working version.",
            "Draft redirects are intended for non-content namespaces and generally should not exist in the main namespace.",
            "If a draft is later developed into a separate standalone page, this redirect may be replaced or removed as appropriate.",
            "Links to these redirects generally do not need to be updated unless the draft or published page is substantially reorganized."
        },
        aliases = { "from-draft", "userspace-draft", "draft-page" }
    },

    double = {
        title = "From an avoided double redirect",
        desc = "This redirect exists to avoid a double redirect by pointing directly to the final target instead of another redirect.",
        bullets = {
            "It preserves navigation when an alternative title or related redirect would otherwise point to another redirect, since double redirects are automatically bypassed or discouraged.",
            "If the intermediate redirect is later retargeted, expanded into its own page, or deleted, this redirect may need to be reviewed and updated.",
            "This is primarily a maintenance redirect and generally requires no changes to incoming links unless the redirect structure itself changes."
        },
        aliases = { "double-redirect", "avoided-double", "avoided-double-redirect" }
    },

    geographic = {
        title = "From a geographic name variant",
        desc = "This redirect is from a geographic name that differs from the preferred title by including additional geographic qualifiers or identifiers.",
        bullets = {
            "Such qualifiers may include a country, state, province, county, region, district, or other administrative division that is unnecessary in the preferred page title.",
            "These redirects follow the wiki's geographic naming conventions while helping readers locate the intended place regardless of how specifically the location is written.",
            "Links to these redirects generally do not need to be updated unless the preferred title is more appropriate in the surrounding context."
        },
        aliases = { "location-country", "location-and-country", "more-specific-geographic", "geographic-name" }
    },

    hatnote = {
        title = "Mentioned in a hatnote",
        desc = "This redirect is mentioned in a hatnote on the target page or another related page to help readers navigate to the intended topic.",
        bullets = {
            "Hatnotes provide navigation between related topics, similar titles, or commonly confused subjects.",
            "This redirect may point to the target page itself, a section, or another related page depending on the context.",
            "If the redirected title later becomes notable enough for its own article or requires a different destination, the redirect should be reviewed and updated."
        },
        aliases = { "mentioned-in-hatnote" }
    },

    history = {
        title = "With page history",
        desc = "This redirect is retained because it preserves the page's edit history, attribution, or historical significance. It is kept for maintenance, licensing, and editorial continuity.",
        bullets = {
            "These redirects preserve substantive edit history, merged content, historical revisions, or other records that should remain accessible for attribution and maintenance purposes.",
            "Examples include redirects retaining substantial page history, redirects created after article merges, duplicated articles kept to preserve attribution, or redirects representing historical versions of the wiki.",
            "Such redirects should generally not be deleted or recreated unless there is a demonstrated need to restore the page as a standalone article or project page.",
            "More specific redirect categories may be used for particular cases, such as redirects with substantive history, old project history, duplicated articles, merged pages, or draft history."
        },
        aliases = { "with-history", "old-history", "with-old-history", "duplicated-article", "duplicate", "merge-history" }
    },

    identifier = {
        title = "From a technical identifier",
        desc = "This redirect is from a technical identifier, code, filename, package name, radio frequency, court case title, or similar unique designation to the related topic.",
        bullets = {
            "Identifiers may include filenames, software package names, class names, court case titles, radio frequencies, catalog numbers, database identifiers, product identifiers, and similar technical references.",
            "These redirects improve searching and reverse lookup by allowing readers to locate the intended page using official or machine-readable identifiers.",
            "Where multiple topics legitimately share the same identifier, a disambiguation page may be more appropriate."
        },
        aliases = { "filename", "java-package", "court-case", "radio-frequency", "frequency" }
    },

    incorrect = {
        title = "From an incorrect name",
        desc = "This redirect is from an incorrect or inaccurate name that users may reasonably search for. The redirect target contains the correct name or title.",
        bullets = {
            "To improve clarity and consistency, pages linking to this redirect should, where practical, be updated to link directly to the target page rather than relying on the redirect."
        },
        aliases = { "incorrect-name", "wrong-name" }
    },

    identity = {
        title = "From an identity variant",
        desc = "This redirect is from another name or identity for the same topic, including an alternative name, former name, synonym, or a non-neutral title.",
        bullets = {
            "These redirects improve navigation and searchability by allowing readers to locate the intended page using different names that refer to the same subject.",
            "Variants may include alternative names, former names, synonyms, colloquial names, promotional or non-neutral titles, and other commonly encountered identities.",
            "Redirects created from clearly incorrect or incomplete names should use the more specific redirect categories instead.",
            "Links to these redirects generally do not need to be updated unless the name is misleading, non-neutral, or otherwise inappropriate in context."
        },
        aliases = { "alternative", "former", "synonym", "non-neutral" }
    },

    ligature = {
        title = "From or to a title with ligatures",
        desc = "This redirect is between titles that differ only by the use or absence of typographic ligatures, such as Æ, æ, Œ, œ, Ĳ, ĳ, ẞ, or ß. One form redirects to the other as the preferred title.",
        bullets = {
            "These redirects improve navigation and searchability by allowing readers to locate the intended page regardless of whether ligatures are used.",
            "They may also be used for redirects to sections or anchors when both the ligature and non-ligature forms are commonly encountered.",
            "This redirect category applies only to differences involving ligatures. Redirects involving diacritics, other non-ASCII characters, or different writing systems should use the appropriate redirect category instead."
        },
        aliases = { "to-ligature", "from-ligature", "title with ligatures", "title without ligatures" }
    },

    manifold = {
        title = "Manifold sort",
        desc = "If additional review is needed to determine the appropriate redirect categories, this redirect is temporarily placed in [[:Category:Miscellaneous redirects]]. Editors monitoring that category may add, remove, or adjust redirect categories (rcats) as necessary.",
        aliases = { "r-manifold" }
    },

    merge = {
        title = "From a merged page",
        desc = "This redirect is from a page whose content has been merged into another page or section. The original page is retained as a redirect to preserve its edit history and provide continuity for incoming links.",
        bullets = {
            "These redirects preserve page history and attribution after duplicate, overlapping, or closely related content has been merged into another page.",
            "The source page may have been an article, draft, template, category, or another page whose content is now covered by the target.",
            "This redirect should generally not be deleted or recreated unless there is a demonstrated need to restore the page as a separate topic.",
            "Links to this redirect generally do not require updating because it continues to provide a valid path to the merged content."
        },
        aliases = { "duplicated-article", "duplicate", "merged-article", "content-merge", "merge" }
    },

    misspelling = {
        title = "From a misspelling",
        desc = "This is a redirect from a misspelled word or phrase. The redirect target contains the correct spelling.",
        bullets = {
            "This redirect helps readers locate the intended page even when an incorrect spelling is entered. Where practical, links in articles should be updated to point directly to the correct title rather than relying on this redirect.",
            "Redirects tagged with this category are automatically classified as redirects from incorrect names. An additional \"incorrect name\" redirect category is therefore unnecessary."
        },
        aliases = { "misspelt", "typo", "misspelled" },
        legacy = { "r-misspelling" }
    },

    modification = {
        title = "From a modification",
        desc = "This redirect is from a modified form of the target's title or a closely related variation. Such changes might include word order, small wording changes, or other versions that keep the same meaning.",
        bullets = {
            "This redirect helps readers find the page when they search for or link to a changed version of the title. In many cases, links to this redirect do not need to be replaced with direct links to the target page."
        },
        aliases = { "modified", "variant", "modification-name" }
    },

    move = {
        title = "From a page move or duplicated article",
        desc = "This redirect is from a page that has been renamed or moved to another title.",
        bullets = {
            "It preserves internal and external links that still point to the former page title.",
            "These redirects improve navigation and help maintain link stability after page renaming.",
            "Links to these redirects generally do not need to be updated unless another title is more appropriate in context."
        },
        aliases = { "move", "page-move", "rename", "renamed" }
    },

    namespace = {
        title = "From or to another namespace",
        desc = "This redirect is between pages in different namespaces, allowing readers and editors to navigate to the corresponding page in another part of the wiki.",
        bullets = {
            "These redirects connect related pages across namespaces, including the main namespace, help pages, project pages, category pages, templates, modules, portals, user pages, talk pages, files, and other namespaces.",
            "The redirect may originate from the same namespace or from a different namespace, depending on local naming conventions and the intended destination.",
            "Some namespace redirects are subject to namespace-specific rules. For example, redirects within the Category namespace are normally implemented as soft redirects rather than standard redirects, while redirects placed in an incorrect namespace may be automatically categorized as being in the wrong namespace.",
            "More specific redirect categories may be used when distinguishing redirects to or from particular namespaces, such as the main namespace, Help, Project, Template, User, Talk, Portal, Module, File, or Category namespaces."
        },
        aliases = {
            "namespaces",

            "mainspace",
            "outside-mainspace",
            "to-mainspace",

            "category-space",
            "to-category-space",
            "outside-category",
            "outside-category-namespace",

            "help",
            "help-page",
            "help-namespace",
            "to-help",
            "to-help-page",

            "project",
            "project-page",
            "wikipedia",
            "wp",
            "to-project",
            "to-project-page",

            "portal",
            "portal-page",
            "to-portal",
            "to-portal-page",

            "template",
            "template-page",
            "outside-template",
            "to-template",

            "user",
            "user-page",
            "outside-user",
            "to-user",

            "talk",
            "talk-page",
            "outside-talk",
            "to-talk",

            "module",
            "module-page",
            "to-module",

            "file",
            "image",
            "to-file",

            "mediawiki",
            "to-mediawiki"
        }
    },

    navigation = {
        title = "To a location within content",
        desc = "This redirect points to a specific location within another page rather than to a standalone article.",
        bullets = {
            "The destination may be a section, embedded anchor, list entry, table entry, or another identifiable location within a page.",
            "These redirects improve navigation by taking readers directly to the most relevant content when a separate page is unnecessary.",
            "Links to these redirects generally do not need to be updated unless the topic later receives its own standalone page."
        },
        aliases = { "to-location", "location", "content-location" }
    },

    numerals = {
        title = "From a numeral variant",
        desc = "This redirect is between equivalent representations of numbers, including Arabic numerals, Roman numerals, written-out numbers, or other accepted numeral forms.",
        bullets = {
            "These redirects improve navigation by allowing readers to reach the intended page regardless of how the number is written.",
            "Equivalent forms may include Arabic numerals (2), Roman numerals (II), or written words (two).",
            "Links to these redirects generally do not need to be replaced unless there is another reason to edit the page."
        },
        aliases = { "numeral", "to-numeral", "roman-numeral", "to-roman-numeral" }
    },

    ordering = {
        title = "From a sorting name",
        desc = "This redirect is from a title whose words are arranged in a different order from the preferred title.",
        bullets = {
            "The most common example is a personal name written surname-first instead of given-name-first.",
            "These redirects exist primarily to improve searching, indexing, and alphabetical sorting.",
            "Links to these redirects generally do not require updating unless another form is clearly preferred in context."
        },
        aliases = { "sort", "sorting-name" }
    },

    person = {
        title = "From or to a person's name",
        desc = "This redirect is from or to a person's name, or a variation of that name, including birth names, personal names, married names, given names, surnames, names with titles, or other commonly recognized forms.",
        bullets = {
            "These redirects improve navigation and searchability by helping readers find the intended page regardless of which form of a person's name is used.",
            "The redirect may refer to a birth name, professional or stage name, married name, given name, surname, honorific title, or another commonly recognized personal name.",
            "Some redirects may point to a joint biography, a broader article, or a section when the individual does not yet have a standalone article.",
            "Where appropriate, redirects representing notable individuals or potential standalone biographies may be expanded into their own articles in the future.",
            "When applicable, use <code>{{DEFAULTSORT:Surname, Given name}}</code> to ensure correct category sorting."
        },
        aliases = {
            "birth", "birth-name", "birth_name",
            "personal", "personal-name", "personal_name",
            "married", "married-name",
            "surname", "given-name", "given_name",
            "name-with-title", "name_with_title",
            "people", "persons", "joint-biography", "joint_biography"
        }
    },

    plural = {
        title = "From or to the plural form",
        desc = "This redirect is between the singular and plural forms of the same word or title.",
        bullets = {
            "It helps readers locate the intended page regardless of whether a singular or plural form is used. Such redirects improve navigation and searchability, especially when one form is the preferred title or is more commonly recognized in usage. In most cases, existing links to these redirects do not need to be updated unless there is another reason to edit the page."
        },
        aliases = { "to-plural", "plural-form" }
    },

    scientific = {
        title = "From or to a scientific name",
        desc = "This redirect is between a scientific name and a common name, an alternative scientific name, or another accepted biological designation for the same organism or taxonomic group.",
        bullets = {
            "These redirects improve navigation by allowing readers to find the intended organism regardless of whether they search using a scientific name, common name, accepted synonym, or scientific abbreviation.",
            "Scientific names may include accepted names, historical or alternative names, abbreviated scientific names, or other taxonomic designations recognized in biological literature.",
            "Links to these redirects generally do not need to be updated unless another title is more appropriate in context."
        },
        aliases = { "scientific-name", "alternative-scientific-name", "scientific-abbreviation" }
    },

    section = {
        title = "To a location within a page",
        desc = "This redirect points to a specific location within another page rather than to a standalone page.",
        bullets = {
            "The destination may be a section heading, an embedded anchor, a list entry, a table entry, or another identifiable location within the target page.",
            "These redirects improve navigation by taking readers directly to the most relevant content when a separate page is unnecessary.",
            "If the topic later becomes notable enough for its own standalone page, the redirect may be replaced with an article."
        },
        aliases = { "to-section", "anchor", "embedded-anchor", "to-anchor", "list-entry", "to-list-entry" }
    },

    shortcut = {
        title = "From a shortcut",
        desc = "This redirect is from a shortcut or abbreviated page name to the corresponding page in any namespace.",
        bullets = {
            "Shortcuts provide a concise and convenient way for editors to access frequently used project, help, policy, template, category, or discussion pages.",
            "They are intended primarily for use in discussions, edit summaries, documentation, and other community pages rather than in mainspace articles.",
            "Links to shortcuts generally do not need to be replaced with the full page title."
        },
        aliases = { "project-shortcut", "shortcut-page" }
    },

    specificity = {
        title = "From a specificity variant",
        desc = "This redirect is from a title that is either more specific or less specific than the preferred page title.",
        bullets = {
            "A more specific title may include additional qualifiers or descriptive wording, while a less specific title may represent a broader or more generic expression.",
            "These redirects improve navigation by connecting readers to the preferred title regardless of the level of detail used in the search term.",
            "Less specific redirects may indicate that a broader overview article could eventually be appropriate."
        },
        aliases = { "more-specific", "less-specific" }
    },

    speech = {
        title = "From a part of speech",
        desc = "This redirect is from a word or phrase representing a particular part of speech, such as a noun, proper noun, verb, adjective, adverb, or gerund, to a related topic or the preferred title.",
        bullets = {
            "These redirects improve navigation and searchability by helping readers find the intended page regardless of the grammatical form used.",
            "Depending on the context, the redirect may represent a different form of the same concept or a closely related term. In most cases, existing links to these redirects do not need to be replaced."
        },
        aliases = {
            "part-of-speech", "part-of speech", "part of speech",
            "adjective", "adverb", "noun", "verb", "gerund",
            "common noun", "common_noun", "common-noun",
            "proper noun", "proper_noun", "proper-noun"
        }
    },

    stylization = {
        title = "From a stylization",
        desc = "This redirect is from a stylized form of the target title, including the use of distinctive capitalization, symbols, punctuation, or other stylistic elements. It redirects to the preferred title in accordance with the wiki's naming conventions.",
        bullets = {
            "This redirect improves navigation and searchability by allowing readers to locate the intended page using a stylized title. Links to this redirect generally do not need to be updated unless doing so improves the surrounding text."
        },
        aliases = { "stylised", "stylized" }
    },

    taxon = {
        title = "From or to a taxonomic rank",
        desc = "This redirect is between related biological taxa at different taxonomic ranks, such as species, genus, family, or other classifications.",
        bullets = {
            "These redirects connect closely related taxonomic concepts, including redirects between species and genera, monotypic taxa and their only members, or other parent–child taxonomic relationships.",
            "Some redirects indicate taxa that may eventually merit their own standalone article while currently redirecting to a broader or closely related taxon.",
            "These redirects improve navigation and searchability while preserving accepted biological classification and naming practices."
        },
        aliases = { "species", "genus", "species-to-genus", "monotypic", "monotypic-taxon", "taxon-with-possibilities" }
    },

    technical = {
        title = "From or to a technical name",
        desc = "This redirect is between a common name and a technical, scientific, legal, or specialized name referring to the same subject.",
        bullets = {
            "It improves navigation and searchability by allowing readers to find the intended page regardless of whether they use a common or specialized term.",
            "Technical names may originate from scientific, engineering, computing, legal, medical, or other professional fields.",
            "Links to these redirects generally do not need to be updated unless a different title is more appropriate in context."
        },
        aliases = { "technical-name", "to-technical", "technical name" }
    }

}
-- =========================
-- AUTO-GENERATE ALIASES
-- =========================
local function registerAlias(alias, target)
    if not alias or alias == "" then
        return
    end

    data.aliases[alias] = target
end

local function registerList(list, target)
    if not list then
        return
    end

    for _, alias in ipairs(list) do
        registerAlias(alias, target)
    end
end

for key, info in pairs(data.rid) do
    registerList(info.aliases, key)
    registerList(info.legacy, key)
end

return data
