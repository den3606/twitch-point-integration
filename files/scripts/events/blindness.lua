local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function Blindness(data, event)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  local effect_id = EntityLoad("data/entities/misc/effect_blindness.xml", x, y)
  EventHelper.SetLifetime(effect_id, 180)
  EntityAddChild(player_entity_id, effect_id)

  return true
end

return Blindness
