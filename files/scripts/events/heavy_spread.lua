local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function HeavySpread(data, event)
  local plyaer_entity_id = GetPlayerEntity()
  local x, y = EntityGetTransform(GetPlayerEntity())
  local effect_id = EntityLoad("mods/twitch-point-integration/files/entities/effect_heavy_spread.xml", x, y)
  EntityAddChild(plyaer_entity_id, effect_id)

  EventHelper.AddIconInHud(effect_id, "data/ui_gfx/status_indicators/high_spread.png", {
    ui_name = "$tpi_heavy_spread",
    ui_description = "$tpi_heavy_spread_description",
    ui_icon = "data/ui_gfx/streaming_event_icons/teleporting_enemies.png",
  })

  return true
end

return HeavySpread
