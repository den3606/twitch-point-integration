local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function SuperKusozakoBomb(data, event)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(GetPlayerEntity())
  x, y = EventHelper.RandomSpawnPoint(x, y)
  EntityLoad("mods/twitch-point-integration/files/entities/super_kusozako_bomb.xml", x, y)

  return true
end

return SuperKusozakoBomb
