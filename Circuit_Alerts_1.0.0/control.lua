require('constants')

script.on_init(function()
	global.alerters = {}
	-- map of playerid to opened entity id
	global.player_ui_map = {}
end)

script.on_event(defines.events.on_tick, function(event)
	-- check every 250ms
	if(game.tick % 15 ~= 0) then
		return
	end

	for _, data in pairs(global.alerters) do
		local ent = data.ent
		local controller = ent.get_control_behavior()
		local is_active = false

		if(controller ~= nil) then
			local params = controller.parameters.parameters

			if(params.first_signal.name ~= nil and params.output_signal.name ~= nil) then
				local signals = controller.signals_last_tick

				if(signals ~= nil) then
					local signal = signals[1].signal
					local force = ent.force
					local msg = 'No message set.'

					if(data.message ~= nil) then
						msg = data.message
					end

					is_active = true

					for _, player in pairs(force.connected_players) do
						player.add_custom_alert(ent, signal, msg, true)
					end
				end
			end
		end

		if(data.active and not is_active) then
			local force = ent.force

			for _, player in pairs(force.connected_players) do
				player.remove_alert({entity=ent})
			end
		end

		data.active = is_active
	end
end)

local function create_rename_gui(player)
	local flow = player.gui.center.add({type="flow", name="ca_rename_flow", style="flow_ca_style", direction="horizontal"})

	local frame = flow.add({type="frame", direction='vertical', name='rename_frame', style="frame_ca_style"})

	local flow1 = frame.add({type="flow", direction="horizontal", style="flow_ca_style"})

	flow1.add({type='label', caption={'gui.set_message_title'}, style='ca_title_label'})
	flow1.add({type="button", name="ca_rename_close", caption="X", style="button_ca_style"})

	local flow2 = frame.add({type="flow", name='container_flow', direction="horizontal", style="flow_ca_style"})
	
	local textbox = flow2.add({type="textfield", name="ca_rename_text", text='', style="textfield_ca_style"})

	local flow3 = flow2.add({type="flow", direction="horizontal", style="flow_ca_style"})
	flow3.style.left_padding = 5
	
	flow3.add({type="button", name="ca_rename_save", caption={"gui.save"}, style="button_ca_style"})
end

script.on_event("ca_open", function(event)
	local player = game.players[event.player_index]
	local entity = player.selected
	
	if(entity ~= nil and entity.name == 'ca_alerter') then
		global.player_ui_map[player.index] = entity
		create_rename_gui(player)
	end
end)

script.on_event(defines.events.on_gui_click, function(event)
	local player = game.players[event.player_index]

	if(event.element.name == 'ca_rename_save') then
		local text = trim(player.gui.center['ca_rename_flow']['rename_frame']['container_flow']['ca_rename_text'].text)
		player.gui.center['ca_rename_flow'].destroy()

		local ent = global.player_ui_map[player.index]

		if(ent == nil or not ent.valid) then
			return
		end
		
		if(text ~= "") then
			if(string.len(text) > 50) then
				player.print('Message may not be longer than 50 characters.')
				return
			end

			global.alerters[ent.unit_number]['message'] = text
		end
	elseif(event.element.name == 'ca_rename_close') then
		player.gui.center['ca_rename_flow'].destroy()
	end
end)

local function on_entity_created(entity)
	if(entity.name ==	'ca_alerter') then
		global.alerters[entity.unit_number] = {ent=entity, active=false, message=nil}
	end
end

local function on_entity_deleted(entity)
	if(global.alerters[entity.unit_number] ~= nil) then
		global.alerters[entity.unit_number] = nil
	end
end

script.on_event(defines.events.on_robot_built_entity, function(event)
	on_entity_created(event.created_entity)
end)

script.on_event(defines.events.on_built_entity, function(event)
	on_entity_created(event.created_entity)
end)


script.on_event(defines.events.on_entity_died, function(event)
	on_entity_deleted(event.entity)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	on_entity_deleted(event.entity)
end)

script.on_event(defines.events.on_robot_pre_mined, function(event)
	on_entity_deleted(event.entity)
end)