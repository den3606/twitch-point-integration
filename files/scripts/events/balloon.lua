local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function Balloon(data, event)
  local player_entity_id = GetPlayerEntity()

  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)

  local effect_id = EntityLoad("mods/twitch-point-integration/files/entities/effect_balloon.xml", x, y)
  EntityAddChild(player_entity_id, effect_id)

  return true
end

return Balloon
