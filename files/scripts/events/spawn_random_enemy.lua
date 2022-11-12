local function SpawnRandomEnemy(data)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  x = x + (Random(1, 2) == 1 and Random(-60, -30) or Random(30, 60))
  y = y - Random(-30, 30)



  local animals = dofile_once("mods/twitch-point-integration/files/scripts/animal_list_from_conjurer.lua")
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  local target_idnex = Random(1, #animals)
  EntityLoad(animals[target_idnex].path, x, y)

  return true
end

return SpawnRandomEnemy
