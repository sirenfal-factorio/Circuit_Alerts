data.raw["gui-style"]["default"]["ca_frame"] = {
	type = "frame_style",
	font = "default-frame",
	font_color = {r=1, g=1, b=1},
	top_padding = 3,
	right_padding = 3,
	bottom_padding = 3,
	left_padding = 3,
	graphical_set = {
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {1, 1},
		position = {3, 3}
	},
	flow_style = {
		horizontal_spacing = 0,
		vertical_spacing = 0
	}
}

data.raw["gui-style"]["default"]["ca_flow"] = {
	type = "flow_style", 
	horizontal_spacing = 0, 
	vertical_spacing = 0, 
	max_on_row = 0, 
	resize_row_to_width = false, 
	resize_to_row_height = false
}


data:extend({
	{
		type = "font",
		name = "font_bold_fre",
		from = "default-bold",
		border = false,
		size = 15
	},
})


data.raw["gui-style"]["default"].frame_ca_style = {
	type="frame_style",
	parent="frame_style",
	top_padding = 4,
	right_padding = 4,
	bottom_padding = 4,
	left_padding = 4,
	resize_row_to_width = true,
	resize_to_row_height = false,
}

data.raw["gui-style"]["default"].flow_ca_style = {
	type = "flow_style",
	
	top_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	right_padding = 0,
	
	horizontal_spacing = 2,
	vertical_spacing = 2,
	resize_row_to_width = true,
	resize_to_row_height = false,
	max_on_row = 1,
	
	graphical_set = { type = "none" },
}

data.raw["gui-style"]["default"].textfield_ca_style = {
    type = "textfield_style",
	font="font_bold_fre",
	align = "left",
    font_color = {},
	default_font_color= {r=1, g=1, b=1},
	hovered_font_color= {r=1, g=1, b=1},
    selection_background_color= {r=0.66, g=0.7, b=0.83},
	top_padding = 0,
	bottom_padding = 0,
	left_padding = 1,
	right_padding = 0,
	minimal_width = 200,
	maximal_width = 200,
	graphical_set = {
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {16, 0}
	},
}    

data.raw["gui-style"]["default"].button_ca_style = {
	type="button_style",
	parent="button_style",
	font="font_bold_fre",
	default_font_color= {r=1, g=1, b=1},
	hovered_font_color= {r=1, g=1, b=1},
	top_padding = 0,
	right_padding = 4,
	bottom_padding = 0,
	left_padding = 4,
	left_click_sound = {
		{
		  filename = "__core__/sound/gui-click.ogg",
		  volume = 1
		}
	},
}

data.raw["gui-style"]["default"].ca_title_label = {
	type="label_style",
	parent="label_style",
	font="font_bold_fre",
	align = "left",
	default_font_color= {r=1, g=1, b=1},
	hovered_font_color= {r=1, g=1, b=1},
	top_padding = 0,
	bottom_padding = 0,
	left_padding = 1,
	-- I can't figure out how this shitty GUI system works, manually right align this like it's CSS in 1999
	--
	-- We're a game that encourages modding! Let's not document how anything works! HAHAHAHAHAHA
	-- When people ask questions give them useless answers or ignore them!
	--       https://forums.factorio.com/viewtopic.php?f=28&t=38024
	--       https://forums.factorio.com/viewtopic.php?f=25&t=28688
	minimal_width = 227,
	maximal_width = 227,
}