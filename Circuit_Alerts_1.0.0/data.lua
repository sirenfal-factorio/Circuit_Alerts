require('volt_util')
require('style')

data:extend({
	{
		type = "custom-input",
		name = "ca_open",
		key_sequence = "SHIFT + E",
		consuming = "script-only"
	},

	{
		type = "item",
		name = "ca_alerter",
		icon = "__Circuit_Alerts__/graphics/icons/ca_alerter.png",
		flags = { "goes-to-quickbar" },
		subgroup = "circuit-network",
		place_result="ca_alerter",
		order = "a[ca_alerter]",
		stack_size= 50,
	},
	{
		type = "recipe",
		name = "ca_alerter",
		enabled = false,
		ingredients =
		{
			{"copper-cable", 5},
			{"electronic-circuit", 5},
		},
		result = "ca_alerter"
	},
	clone_existing_data(data.raw['decider-combinator']['decider-combinator'], {
		name = 'ca_alerter',
		icon = "__Circuit_Alerts__/graphics/icons/ca_alerter.png",
		minable = {hardness = 0.2, mining_time = 0.5, result = "ca_alerter"},
		output_connection_points = nil,
		input_connection_bounding_box = {{-0.5, -1}, {0.5, 1}},
		output_connection_bounding_box = nil, --{{0, 0}, {0, 0}},

		sprites = {
			north = {
				filename = "__Circuit_Alerts__/graphics/entity/combinator/combinator-entities.png",
				x = 158,
				width = 79,
				height = 63,
				frame_count = 1,
				shift = {0.140625, 0.140625},
			},
			east = {
				filename = "__Circuit_Alerts__/graphics/entity/combinator/combinator-entities.png",
				width = 79,
				height = 63,
				frame_count = 1,
				shift = {0.140625, 0.140625},
			},
			south = {
				filename = "__Circuit_Alerts__/graphics/entity/combinator/combinator-entities.png",
				x = 237,
				width = 79,
				height = 63,
				frame_count = 1,
				shift = {0.140625, 0.140625},
			},
			west = {
				filename = "__Circuit_Alerts__/graphics/entity/combinator/combinator-entities.png",
				x = 79,
				width = 79,
				height = 63,
				frame_count = 1,
				shift = {0.140625, 0.140625},
			}
		},
	}),
	{
		type = "technology",
		name = "ca_alerter",
		icon = "__base__/graphics/technology/circuit-network.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "ca_alerter"
			}
		},
		prerequisites = {"circuit-network"},
		unit =
		{
			count = 30,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 15
		},
		order = "a-d-d",
	},
})