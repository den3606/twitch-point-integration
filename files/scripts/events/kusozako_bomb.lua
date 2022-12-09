local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function KusozakoBomb(data, event)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(GetPlayerEntity())
  for i = 1, 8 do
    EventHelper.RandomPositionSpawn(x, y, 10, 0, 80, 30, function(target_x, target_y)
      EntityLoad("mods/twitch-point-integration/files/entities/projectiles/kusozako_bomb.xml", target_x, target_y)
    end)
  end

  return true
end

return KusozakoBomb
