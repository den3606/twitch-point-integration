local function HelloDeer(data, events)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()

  if (player_entity_id == nil) then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  x = x + (Random(1, 2) == 1 and Random(-40, -10) or Random(10, 40))
  y = y - Random(10, 30)

  local deer_entity = nil
  if Random(1, 100) <= 10 then
    deer_entity = EntityLoad("data/entities/projectiles/deck/exploding_deer.xml", x, y)
  else
    deer_entity = EntityLoad("data/entities/animals/deer.xml", x, y)
  end

  EntityAddChild(deer_entity, EventHelper.CreateDisplayNameEntity(data.used_by))
  EntityAddTag(deer_entity, "dont_append_name")

end

return HelloDeer
