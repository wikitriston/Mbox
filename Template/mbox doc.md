{{Documentation subpage}}
==Dependencies==
{{dependencies|Module:Message box|Module:Message box/configuration|Module:Arguments|Module:Yesno}}
{{Uses TemplateStyles|Template:Mbox/styles.css}}
You may want to use [[Template:Ambox]] or [[Template:MessageBox]] instead, which have fewer features but are easier to export.

{{tl|mbox}} stands for '''m'''essage '''box''', which is a metatemplate used to build message boxes for other templates. It offers several different colours, images and some other features.

==Basic usage==
The box below shows the most common parameters that are accepted by {{Tl|mbox}}. The purpose of each is described below.
<pre style="overflow:auto;">
{{mbox
| name  = 
| small = {{{small|}}}
| type  = 
| image = 
| sect  = {{{1|}}}
| issue = 
| talk  = {{{talk|}}}
| fix   = 
| date  = {{{date|}}}
| cat   = 
| all   = 
}}
</pre>

==Full usage==
The "All parameters" box shows all possible parameters for this template. However, it is not recommended to copy this, because it will never be required to use all parameters simultaneously.

{| class="wikitable" align="left" style="background:transparent; width=30%;" 
!All parameters
|-
|<pre style="font-size:100%">
{{mbox
| name        = 
| small       = {{{small|}}}
| type        = 
| image       = 
| imageright  = 
| smallimage  = 
| smallimageright = 
| class       = 
| style       = 
| textstyle   = 
| sect        = {{{1|}}}
| issue       = 
| talk        = {{{talk|}}}
| fix         = 
| date        = {{{date|}}}
| text        = 
| smalltext   = 
| plainlinks  = no
| removalnotice =
| cat         = 
| all         = 
| cat2        = 
| all2        = 
| cat3        = 
| all3        = 
}}
</pre>
|}
{{clear}}
==Common parameters==
=== ''name'' ===
The ''name'' parameter specifies the name of the template, without the Template namespace prefix. For example [[w:Template:Underlinked]] specifies {{Para|name|Underlinked}}.

This parameter should be updated if the template is ever moved. The purpose of this parameter is to allow the template to have a more useful display on its template page, for example to show the date even when not specified, and to apply categorisation of the template itself.

=== ''small'' ===
The ''small'' parameter should be passed through the template, as this will allow editors to use the small format by specifying {{para|small|left}} on an article:
{{mbox|nocat=true|small=left|text=This is the small left-aligned mbox format.}}
Otherwise the standard format will be produced:
{{mbox|nocat=true|text=This is the standard mbox format.}}

Other variations:
* For templates which should ''never'' be small, specify {{Para|small|no}} or do not pass the small parameter at all.
* For templates which should ''always'' be small, just specify {{Para|small|left}}.
* For templates which should ''default to small'', try {{para|small|<nowiki>{{{small|left}}}</nowiki>}}. This will allow an editor to override by using {{para|small|no}} on an article.

To use a small box that adjusts its width to match the text, use {{para|style|width: auto; margin-right: 0px;}} and {{para|textstyle|width: auto;}} together:
{{mbox|nocat=true|small=left|style=width: auto; margin-right: 0px;|textstyle=width: auto; margin-right: 0px;|text=This is the small left-aligned Ambox format with flexible width.}}

See [[#Sect]] below for more information on how to limit {{para|small}} display to cases when the template is being used for a section instead of the whole article (recommended, to prevent inconsistent top-of-article display).

=== ''type'' ===
The ''type'' parameter defines the colour of the left bar, and the image that is used by default. The type is chosen not on aesthetics but is based on the type of issue that the template describes. The seven available types and their default images are shown below.
{{mbox
|nocat=true
| type  = speedy
| text  = type=<u>speedy</u> – Speedy deletion issues
}}
{{mbox
|nocat=true
| type  = delete
| text  = type=<u>delete</u> – Deletion issues,
}}
{{mbox
|nocat=true
| type  = content
| text  = type=<u>content</u> – Content issues
}}
{{mbox
|nocat=true
| type  = style
| text  = type=<u>style</u> – Style issues
}}
{{mbox
|nocat=true
| type  = notice
| text  = type=<u>notice</u> – Article notices
}}
{{mbox
|nocat=true
| type  = move
| text  = type=<u>move</u> – Merge, split and transwiki proposals
}}
{{mbox
|nocat=true
| type  = protection
| text  = type=<u>protection</u> – Protection notices,
}}

If no ''type'' parameter is given the template defaults to {{para|type|notice}}.

=== ''image'' ===
You can choose a specific image to use for the template by using the ''image'' parameter. Images are specified using the standard syntax for inserting files. Widths of 40-50px are typical. 

Please note:
* If no image is specified then the default image corresponding to the ''type'' is used. (See [[#type]] above.)
* If {{para|image|none}} is specified, then no image is used and the text uses the whole message box area.

=== ''sect'' ===
Many message templates begin with the text '''This article ...''' and it is often desirable that this wording change to '''This section ...''' if the template is used on a section instead. The value of this parameter will replace the word "article". Various possibilities for use include: {{para|sect|list}}, {{para|sect|table}}, {{para|sect|"In popular culture" material}}, etc.

If using this feature, be sure to remove the first two words ("This article") from the template's text, otherwise it will be duplicated.

A common way to facilitate this functionality is to pass {{para|sect|<nowiki>{{{1|}}}</nowiki>}}. This will allow editors to type <kbd>section</kbd>, for example, as the first unnamed parameter of the template to change the wording. Another approach is to pass {{para|sect|<nowiki>{{{section|{{{sect|}}}}}}</nowiki>}} to provide a named value. 

=== ''issue'' and ''fix'' ===
The ''issue'' parameter is used to describe the issue with the page. Try to keep it short and to-the-point (approximately 10-20 words).

The ''fix'' parameter contains some text which describes what should be done to improve the page. It may be longer than the text in ''issue'', but should not usually be more than two sentences.

When the template is in its small form (when using {{para|small|left}}), the ''issue'' is the only text that will be displayed. For example [[w:Template:Citation style]] defines

When used stand-alone it produces the whole text:

But when used with |small=left it displays only the issue:

=== ''talk'' ===
Some message templates include a link to the talk page, and allow an editor to specify a section heading to link directly to the relevant section. To achieve this functionality, simply pass the ''talk'' parameter through, i.e. talk=<nowiki>{{{talk|}}}</nowiki>

This parameter may then be used by an editor as follows:
* talk=SECTION HEADING – the link will point to the specified section on the article's talk page, e.g. talk=Foo.
* talk=FULL PAGE NAME – the template will link to the page specified (which may include a section anchor), e.g. talk=Talk:Banana#Foo

Notes:
* When this parameter is used by a template, the talk page link will appear on the template itself (in order to demonstrate the functionality) but this will only display on articles if the parameter is actually defined.
* In order to make sure there is always a link to the talk page, you can use |talk=<nowiki>{{{talk|#}}}</nowiki>.
* If the talk page does not exist, there will be no link, whatever the value of the parameter.

=== ''date'' ===
Passing the ''date'' parameter through to the meta-template means that the date that the article is tagged may be specified by an editor (or more commonly a bot). This will be displayed after the message in a smaller font.

Passing this parameter also enables monthly cleanup categorisation when the ''cat'' parameter is also defined.

=== ''info'' ===
This parameter is for specifying additional information. Whatever you add here will appear after the date.

=== ''cat'' ===
This parameter defines a monthly cleanup category. If |cat=CATEGORY then:
* articles will be placed in '''Category:CATEGORY from DATE''' if  |date=DATE is specified.
* articles will be placed in '''Category:CATEGORY''' if the date is not specified.

For example, [[w:Template:No footnotes]] specifies |cat=Articles lacking in-text citations and so an article with the template {{Tlx|No footnotes|2=date=June 2010|SISTER=w:}} will be placed in [[w:Category:Articles lacking in-text citations from June 2010]].

The ''cat'' parameter should not be linked, nor should the prefix <code>Category:</code> be used.

=== ''all'' ===
The ''all'' parameter defines a category into which all articles should be placed.

The ''all'' parameter should not be linked, nor should the prefix <code>Category:</code> be used.

== Additional parameters ==
=== ''imageright'' ===
An image on the right side of the message box may be specified using this parameter. The syntax is the same as for the ''image'' parameter, except that the default is no image.

=== ''smallimage'' and ''smallimageright'' ===
Images for the small format box may be specified using these parameters. They will have no effect unless {{para|small|left}} is specified.

=== ''class'' ===
Custom [[w:Cascading Style Sheets|CSS]] classes to apply to the box. If adding multiple classes, they should be space-separated.

=== ''style'' and ''textstyle'' ===
Optional CSS values may be defined, without quotation marks <code>" "</code> but with the ending semicolons <code>;</code>.
* ''style'' specifies the style used by the entire message box table. This can be used to do things such as modifying the width of the box.
* ''textstyle'' relates to the text cell.

=== ''text'' and ''smalltext'' ===
Instead of specifying the ''issue'' and the ''fix'' it is possible to use the ''text'' parameter instead.

Customised text for the small format can be defined using ''smalltext''.

=== ''plainlinks'' ===
Normally on Wikipedia, external links have an arrow icon next to them, like this: [http://www.example.com Example.com]. However, in message boxes, the arrow icon is suppressed by default, like this: <span class="plainlinks">[http://www.example.com Example.com]</span>. To get the normal style of external link with the arrow icon, use {{para|plainlinks|no}}.

=== ''cat2'', ''cat3'', ''all2'', and ''all3'' ===
* ''cat2'' and ''cat3'' provide for additional monthly categories; see [[#cat]].
* ''all2'' and ''all3'' provide for additional categories into which all articles are placed, just like [[#all]].

== Technical notes ==
* If you need to use special characters in the text parameter then you need to escape them like this:
<syntaxhighlight lang="xml">
{{mbox
|nocat=true
| text  = <div>
Equal sign = and a start and end brace { } work fine as they are.
But here is a pipe &#124; and two end braces <nowiki>}}</nowiki>.
And now a pipe and end braces <nowiki>|}}</nowiki>.
</div>
}}
</syntaxhighlight>
{{mbox
|nocat=true
| text  = <div>
Equal sign = and a start and end brace { } work fine as they are.
But here is a pipe &#124; and two end braces <nowiki>}}</nowiki>.
And now a pipe and end braces <nowiki>|}}</nowiki>.
</div>
}}

* The <code>&lt;div></code> tags that surround the text in the example above are usually not needed. But if the text contains line breaks then sometimes we get weird line spacing. This especially happens when using vertical dotted lists. Then use the div tags to fix that.
* The default images for this meta-template are in png format instead of svg format. The main reason is that some older web browsers have trouble with the transparent background that MediaWiki renders for svg images. The png images here have hand optimised transparent background colour so they look good in all browsers. Note that svg icons only look somewhat bad in the old browsers, thus such hand optimisation is only worth the trouble for very widely used icons.

== See also ==
;There are seven metatemplates in the '''Message box''' family:
* {{tl|Ambox}}, for messageboxes on '''article''' pages.
* {{tl|Cmbox}}, for messageboxes on '''category''' pages.
* {{tl|Imbox}}, for messageboxes on '''file''' (image) pages.
* {{tl|Tmbox}}, for messageboxes on '''talk''' pages.
* {{tl|Fmbox}}, for '''header and footer''' messageboxes.
* {{tl|Ombox}}, for messageboxes on '''other types''' of page.
* {{tl|Mbox}}, for messageboxes that are used in '''different namespaces and change their presentation accordingly'''.

Closely related metatemplates:
* {{tl|Article stub box}}, for messageboxes in '''article stubs'''.

== TemplateData ==
{{TemplateData header}}
<templatedata>
{
	"description": "General message box template powered by Module:Message box. Supports namespace-based demospace rendering and full customization of layout, icons, and text.",
	"format": "block",
	"params": {
		"type": {
			"label": "Type",
			"description": "Determines the default color bar and icon. Common values include: speedy, delete, content, style, notice, move, protection.",
			"type": "string",
			"default": "notice",
			"suggested": true,
			"suggestedvalues": [
				"speedy",
				"delete",
				"content",
				"notice",
				"move",
				"protection",
				"commons",
				"licence"
			]
		},
		"demospace": {
			"label": "Demospace",
			"description": "Simulates the display style of a specific namespace (user, talk, image, file, category, article, main).",
			"type": "string",
			"required": true,
			"suggestedvalues": [
				"mbox",
				"ambox",
				"tmbox",
				"imbox",
				"cmbox",
				"ombox",
				"fmbox"
			]
		},
		"text": {
			"label": "Main text",
			"description": "The primary message text displayed inside the box.",
			"type": "content",
			"required": true,
			"suggested": true
		},
		"small": {
			"label": "Small layout",
			"description": "Enter 'yes' or 'true' to switch the message box to a compact, smaller layout (usually right-aligned).",
			"type": "boolean",
			"default": "no",
			"required": false
		},
		"smalltext": {
			"label": "Small text",
			"description": "Alternative text used instead of 'text' or 'issue' when the 'small' parameter is enabled.",
			"type": "content",
			"required": false
		},
		"image": {
			"label": "Left image",
			"description": "Image displayed in the left cell. Enter 'none' or 'blank' to hide. If left empty, the default icon for the specified 'type' is used.",
			"type": "wiki-file-name",
			"required": false,
			"suggested": true
		},
		"imageright": {
			"label": "Right image",
			"description": "Image displayed in the right cell. Enter 'none' to hide.",
			"type": "wiki-file-name",
			"required": false
		},
		"smallimage": {
			"label": "Small left image",
			"description": "Left image displayed when the 'small' parameter is enabled.",
			"type": "wiki-file-name",
			"required": false
		},
		"smallimageright": {
			"label": "Small right image",
			"description": "Right image displayed when the 'small' parameter is enabled.",
			"type": "wiki-file-name",
			"required": false
		},
		"sect": {
			"label": "Section prefix",
			"description": "The scope of the message box (e.g., 'section', 'table', 'list'). Generates the prefix 'This [sect]' before the issue text.",
			"type": "string",
			"required": false
		},
		"issue": {
			"label": "Issue",
			"description": "A concise description of the issue on the page. Displayed prominently when using collapsible text fields.",
			"type": "content",
			"required": false
		},
		"talk": {
			"label": "Talk page / Discussion",
			"description": "The relevant talk page or section. Automatically generates a link directing users to the discussion.",
			"type": "string",
			"required": false
		},
		"fix": {
			"label": "Fix instructions",
			"description": "Instructions on how to resolve the issue. Hidden when displayed in compact mode.",
			"type": "content",
			"required": false
		},
		"date": {
			"label": "Date",
			"description": "The month and year the template was added (e.g., 'August 2026'). Displayed in smaller text at the end of the message.",
			"type": "string",
			"required": false,
			"suggested": true
		},
		"info": {
			"label": "Additional info",
			"description": "Supplementary detailed information. Hidden when displayed in compact mode.",
			"type": "content",
			"required": false
		},
		"below": {
			"label": "Below text",
			"description": "Content displayed in a full-width bottom row spanning across the image and text columns.",
			"type": "content",
			"required": false
		},
		"plainlinks": {
			"label": "Plain links",
			"description": "Defaults to 'yes' (hides the external link arrow icon). Enter 'no' to display standard external link icons.",
			"type": "boolean",
			"default": "yes",
			"required": false
		},
		"id": {
			"label": "HTML ID",
			"description": "An HTML ID attribute applied to the message box's main <table> element.",
			"type": "string",
			"required": false
		},
		"name": {
			"label": "Template name",
			"description": "The name of the template calling the module (e.g., 'Template:Mbox'). Used to generate the 'box-[name]' class and detect template pages.",
			"type": "string",
			"required": false
		},
		"class": {
			"label": "Additional CSS classes",
			"description": "Extra CSS classes added to the main <table> element.",
			"type": "string",
			"required": false
		},
		"style": {
			"label": "Main CSS style",
			"description": "Inline CSS styling applied to the main <table> element.",
			"type": "string",
			"required": false
		},
		"attrs": {
			"label": "Additional HTML attributes",
			"description": "Extra HTML attributes added to the table (e.g., data-* attributes).",
			"type": "string",
			"required": false
		},
		"textclass": {
			"label": "Text cell CSS class",
			"description": "A custom CSS class applied specifically to the <td> element containing the main text.",
			"type": "string",
			"required": false
		},
		"textstyle": {
			"label": "Text cell CSS style",
			"description": "Inline CSS styling applied to the text <td> cell or the below row.",
			"type": "string",
			"required": false
		}
	},
	"paramOrder": [
		"demospace",
		"type",
		"text",
		"issue",
		"sect",
		"talk",
		"fix",
		"date",
		"info",
		"below",
		"image",
		"imageright",
		"small",
		"smalltext",
		"smallimage",
		"smallimageright",
		"plainlinks",
		"name",
		"id",
		"class",
		"style",
		"textclass",
		"textstyle",
		"attrs"
	]
}
</templatedata><includeonly>[[Category:Notice templates]]</includeonly>
