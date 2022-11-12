local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function Neutralized(data, event)
  local plyaer_entity_id = GetPlayerEntity()
  local x, y = EntityGetTransform(GetPlayerEntity())
  local effect_id = EntityLoad("data/entities/misc/neutralized.xml", x, y)
  EventHelper.SetLifetime(effect_id, 600)
  EntityAddChild(plyaer_entity_id, effect_id)

  return true
end

return Neutralized
