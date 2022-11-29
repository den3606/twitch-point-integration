local function SpawnRandomEnemy(data)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  x, y = EventHelper.RandomSpawnPoint(x, y)

  local animals = dofile_once("mods/twitch-point-integration/files/scripts/animal_list_from_conjurer.lua")

  -- パラレルボスを召喚対象から外す
  for index, animal in ipairs(animals) do
    if animal.name == 'Parallel alchemist' or animal.name == 'Parallel tentacles' then
      table.remove(animals, index)
    end
  end

  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  local target_idnex = Random(1, #animals)
  EntityLoad(animals[target_idnex].path, x, y)

  return true
end

return SpawnRandomEnemy
