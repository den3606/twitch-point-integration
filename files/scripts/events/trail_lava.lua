local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function TrailLava(data, event)
  local player_entity_id = GetPlayerEntity()

  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)

  local effect_id = EntityLoad("data/scripts/streaming_integration/entities/effect_trail_lava.xml", x, y)
  EventHelper.SetLifetime(effect_id, 600)
  EntityAddChild(player_entity_id, effect_id)
  EventHelper.AddIconInHud(effect_id, "data/ui_gfx/status_indicators/trail_lava.png", {
    ui_name = "$streamingevent_trail_lava",
    ui_description = "$streamingeventdesc_trail_lava",
    ui_icon = "data/ui_gfx/streaming_event_icons/protect_enemies.png",
  })

  return true
end

return TrailLava
