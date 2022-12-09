local function SpawnSteve(data)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  GamePrintImportant(GameTextGet("$tpi_secret_steve_spawn", data.used_by))

  local x, y = EntityGetTransform(player_entity_id)
  EventHelper.RandomPositionSpawn(x, y, 60, 0, 30, 30, function(target_x, target_y)
    local steve_entity_id = EntityLoad("data/entities/animals/necromancer_shop.xml", target_x, target_y)
    EntityRemoveTag(steve_entity_id, "necromancer_shop")
    EntityAddChild(steve_entity_id, EventHelper.CreateDisplayNameEntity(data.used_by))
    EntityAddTag(steve_entity_id, "dont_append_name")
  end)


  return true
end

return SpawnSteve
