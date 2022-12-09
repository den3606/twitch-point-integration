local function SpawnSkoude(data)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  GamePrintImportant(GameTextGet("$tpi_secret_skoude_spawn", data.used_by))

  local x, y = EntityGetTransform(player_entity_id)
  EventHelper.RandomPositionSpawn(x, y, 60, 0, 30, 30, function(target_x, target_y)
    local skoude_entity_id = EntityLoad("data/entities/animals/necromancer_super.xml", target_x, target_y)

    EntityRemoveTag(skoude_entity_id, "necromancer_shop")
    EntityAddChild(skoude_entity_id, EventHelper.CreateDisplayNameEntity(data.used_by))
    EntityAddTag(skoude_entity_id, "dont_append_name")
  end)

  return true
end

return SpawnSkoude
