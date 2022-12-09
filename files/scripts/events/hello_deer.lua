local function HelloDeer(data, events)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()

  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  EventHelper.RandomPositionSpawn(x, y, 20, 0, 30, 30, function(target_x, target_y)
    SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
    local deer_entity = nil
    if Random(1, 100) <= 15 then
      deer_entity = EntityLoad("data/entities/projectiles/deck/exploding_deer.xml", target_x, target_y)
    else
      deer_entity = EntityLoad("data/entities/animals/deer.xml", target_x, target_y)
    end

    EntityAddChild(deer_entity, EventHelper.CreateDisplayNameEntity(data.used_by))
    EntityAddTag(deer_entity, "dont_append_name")
  end)

  return true
end

return HelloDeer
