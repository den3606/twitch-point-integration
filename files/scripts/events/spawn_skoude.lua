local function SpawnSkoude(data)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  x = x + (Random(1, 2) == 1 and Random(-40, -30) or Random(30, 40))
  y = y - Random(-30, 30)

  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())

  GamePrintImportant(GameTextGet("$tpi_secret_skoude_spawn", data.used_by))
	local skoude_entity_id = EntityLoad("data/entities/animals/necromancer_super.xml", x, y)

  EntityRemoveTag(skoude_entity_id, "necromancer_shop")
  EntityAddChild(skoude_entity_id, EventHelper.CreateDisplayNameEntity(data.used_by))
  EntityAddTag(skoude_entity_id, "dont_append_name")

  return true
end

return SpawnSkoude
