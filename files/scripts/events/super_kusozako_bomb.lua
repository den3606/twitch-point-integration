local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function SuperKusozakoBomb(data, event)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(GetPlayerEntity())
  EventHelper.RandomPositionSpawn(x, y, 0, 0, 60, 60, function(target_x, target_y)
    EntityLoad("mods/twitch-point-integration/files/entities/projectiles/super_kusozako_bomb.xml", target_x, target_y)
  end)

  return true
end

return SuperKusozakoBomb
