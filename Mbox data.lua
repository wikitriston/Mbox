return {
	ambox = {
		types = {
			speedy = {
				class = 'ambox-speedy',
				image = 'Icon of Red Warning.svg'
			},
			delete = {
				class = 'ambox-delete',
				image = 'Icon of Red Warning.svg'
			},
			content = {
				class = 'ambox-content',
				image = 'Ambox important.svg'
			},
			style = {
				class = 'ambox-style',
				image = 'Edit-clear.svg'
			},
			move = {
				class = 'ambox-move',
				image = 'Merge-split-transwiki default.svg'
			},
			protection = {
				class = 'ambox-protection',
				image = 'Semi-protection-shackle-keyhole.svg'
			},
			notice = {
				class = 'ambox-notice',
				image = 'Information icon4.svg'
			}
		},
		aliases = {
			-- Đồng nghĩa tiếng Anh và các lỗi chính tả/gõ tắt thường gặp
			speed = 'speedy',
			warn = 'delete',
			warning = 'delete',
			err = 'speedy',
			error = 'speedy',
			info = 'notice',
			merge = 'move',
			protect = 'protection',
			-- Ánh xạ từ khóa tiếng Việt (rất hữu ích cho người dùng bản địa)
			['khẩn cấp'] = 'speedy',
			['xóa nhanh'] = 'speedy',
			['xóa'] = 'delete',
			['nội dung'] = 'content',
			['chú ý'] = 'content',
			['trình bày'] = 'style',
			['văn phong'] = 'style',
			['di chuyển'] = 'move',
			['gộp'] = 'move',
			['khóa'] = 'protection',
			['bảo vệ'] = 'protection',
			['thông báo'] = 'notice'
		},
		default                     = 'notice',
		allowBlankParams            = {'talk', 'sect', 'date', 'issue', 'fix', 'hidden'},
		allowSmall                  = true,
		smallParam                  = 'left',
		smallClass                  = 'mbox-small-left',
		classes                     = {'metadata', 'ambox'},
		imageEmptyCell              = true,
		imageCheckBlank             = true,
		imageSmallSize              = '20x20px',
		imageCellDiv                = true,
		useCollapsibleTextFields    = true,
		imageRightNone              = true,
		sectionDefault              = 'article',
		allowMainspaceCategories    = true,
		templateCategory            = 'Article message templates',
		templateCategoryRequireName = true,
		templateErrorCategory       = 'Article message templates with missing parameters',
		templateErrorParamsToCheck  = {'issue', 'fix'},
	},
	
	cmbox = {
		types = {
			speedy = {
				class = 'cmbox-speedy',
				image = 'Ambox warning pn.svg'
			},
			delete = {
				class = 'cmbox-delete',
				image = 'Ambox warning pn.svg'
			},
			content = {
				class = 'cmbox-content',
				image = 'Ambox important.svg'
			},
			style = {
				class = 'cmbox-style',
				image = 'Edit-clear.svg'
			},
			move = {
				class = 'cmbox-move',
				image = 'Merge-split-transwiki default.svg'
			},
			protection = {
				class = 'cmbox-protection',
				image = 'Semi-protection-shackle-keyhole.svg'
			},
			notice = {
				class = 'cmbox-notice',
				image = 'Information icon4.svg'
			}
		},
		aliases = {
			speed = 'speedy',
			warn = 'delete',
			warning = 'delete',
			info = 'notice',
			merge = 'move',
			['xóa nhanh'] = 'speedy',
			['xóa'] = 'delete',
			['khóa'] = 'protection',
			['thông báo'] = 'notice'
		},
		default              = 'notice',
		showInvalidTypeError = true,
		classes              = {'cmbox'},
		imageEmptyCell       = true
	},
	
	fmbox = {
		types = {
			warning = {
				class = 'fmbox-warning',
				image = 'Ambox warning pn.svg'
			},
			editnotice = {
				class = 'fmbox-editnotice',
				image = 'Information icon4.svg'
			},
			system = {
				class = 'fmbox-system',
				image = 'Information icon4.svg'
			}
		},
		aliases = {
			warn = 'warning',
			notice = 'editnotice',
			sys = 'system',
			['cảnh báo'] = 'warning',
			['hệ thống'] = 'system'
		},
		default              = 'system',
		showInvalidTypeError = true,
		classes              = {'fmbox'},
		imageEmptyCell       = false,
		imageRightNone       = false
	},
	
	imbox = {
		types = {
			speedy = {
				class = 'imbox-speedy',
				image = 'Icon of Red Warning.svg'
			},
			delete = {
				class = 'imbox-delete',
				image = 'Icon of Red Warning.svg'
			},
			warn = {
				class = 'imbox-warn',
				image = 'Icon of Red Warning.svg'
			},
			content = {
				class = 'imbox-content',
				image = 'Ambox important.svg'
			},
			style = {
				class = 'imbox-style',
				image = 'Edit-clear.svg'
			},
			move = {
				class = 'imbox-move',
				image = 'Merge-split-transwiki default.svg'
			},
			protection = {
				class = 'imbox-protection',
				image = 'Semi-protection-shackle-keyhole.svg'
			},
			license = {
				class = 'imbox-license licensetpl',
				image = 'Imbox license.png'
			},
			commons = {
				class = 'imbox-commons',
				image = 'Imbox license.png'
			},
			featured = {
				class = 'imbox-featured',
				image = 'Cscr-featured.svg'
			},
			notice = {
				class = 'imbox-notice',
				image = 'Information icon4.svg'
			}
		},
		aliases = {
			speed = 'speedy',
			warning = 'warn',
			lic = 'license',
			['bản quyền'] = 'license',
			['giấy phép'] = 'license',
			['xóa'] = 'delete',
			['thông báo'] = 'notice'
		},
		default              = 'notice',
		showInvalidTypeError = true,
		classes              = {'imbox'},
		imageEmptyCell       = true,
		below                = true,
		templateCategory     = 'File message boxes'
	},
	
	ombox = {
		types = {
			speedy = {
				class = 'ombox-speedy',
				image = 'Ambox warning pn.svg'
			},
			delete = {
				class = 'ombox-delete',
				image = 'Ambox warning pn.svg'
			},
			content = {
				class = 'ombox-content',
				image = 'Ambox important.svg'
			},
			style = {
				class = 'ombox-style',
				image = 'Edit-clear.svg'
			},
			move = {
				class = 'ombox-move',
				image = 'Merge-split-transwiki default.svg'
			},
			protection = {
				class = 'ombox-protection',
				image = 'Semi-protection-shackle-keyhole.svg'
			},
			notice = {
				class = 'ombox-notice',
				image = 'Information icon4.svg'
			}
		},
		aliases = {
			speed = 'speedy',
			warn = 'delete',
			warning = 'delete',
			info = 'notice',
			merge = 'move',
			['xóa nhanh'] = 'speedy',
			['xóa'] = 'delete',
			['thông báo'] = 'notice'
		},
		default              = 'notice',
		showInvalidTypeError = true,
		classes              = {'ombox'},
		allowSmall           = true,
		imageEmptyCell       = true,
		imageRightNone       = true
	},
	
	tmbox = {
		types = {
			speedy = {
				class = 'tmbox-speedy',
				image = 'Ambox warning pn.svg'
			},
			delete = {
				class = 'tmbox-delete',
				image = 'Ambox warning pn.svg'
			},
			content = {
				class = 'tmbox-content',
				image = 'Ambox important.svg'
			},
			style = {
				class = 'tmbox-style',
				image = 'Edit-clear.svg'
			},
			move = {
				class = 'tmbox-move',
				image = 'Merge-split-transwiki default.svg'
			},
			protection = {
				class = 'tmbox-protection',
				image = 'Semi-protection-shackle-keyhole.svg'
			},
			notice = {
				class = 'tmbox-notice',
				image = 'Information icon4.svg'
			}
		},
		aliases = {
			speed = 'speedy',
			warn = 'delete',
			warning = 'delete',
			info = 'notice',
			merge = 'move',
			['thảo luận'] = 'notice',
			['thông báo'] = 'notice'
		},
		default              = 'notice',
		showInvalidTypeError = true,
		classes              = {'tmbox'},
		allowSmall           = true,
		imageRightNone       = true,
		imageEmptyCell       = true,
		imageEmptyCellStyle  = true,
		templateCategory     = 'Talk message boxes'
	}
}
