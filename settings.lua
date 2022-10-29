dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.

local mod_id = "twitch-point-integration"
mod_settings_version = 1
mod_settings =
{
  {
		id = "channelName",
		ui_name = "channelName",
		ui_description = "Your channel name.",
    value_default = "",
    text_max_length = 20,
    allowed_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789",
    scope = MOD_SETTING_SCOPE_NEW_GAME,
  },
  {
		id = "hostName",
		ui_name = "hostName",
		ui_description = "Connection point",
    value_default = "",
    text_max_length = 400,
    allowed_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_.0123456789",
    scope = MOD_SETTING_SCOPE_NEW_GAME,
  },
  {
		id = "updateRate",
		ui_name = "updateRate",
		ui_description = "Event receive frame interval (Lower values make noita client heavier.)\nIf value set 20, Client check event 3 times per 1 second.",
    value_default = "20",
    text_max_length = 2,
    allowed_characters = "0123456789",
    scope = MOD_SETTING_SCOPE_NEW_GAME,
  },
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id ) -- This can be used to migrate some settings between mod versions.
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
