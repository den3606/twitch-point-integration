local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function KusozakoBomb(data, event)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(GetPlayerEntity())
  for i = 1, 8 do
    x, y = EventHelper.RandomSpawnPoint(x, y)
    EntityLoad("mods/twitch-point-integration/files/entities/kusozako_bomb.xml", x, y)
  end

  return true
end

return KusozakoBomb
