local function SpawnSteve(data)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  x, y = EventHelper.RandomSpawnPoint(x, y)

  GamePrintImportant(GameTextGet("$tpi_secret_steve_spawn", data.used_by))
	local steve_entity_id = EntityLoad("data/entities/animals/necromancer_shop.xml", x, y)
  EntityRemoveTag(steve_entity_id, "necromancer_shop")
  EntityAddChild(steve_entity_id, EventHelper.CreateDisplayNameEntity(data.used_by))
  EntityAddTag(steve_entity_id, "dont_append_name")

  return true
end

return SpawnSteve
