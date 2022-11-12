local function SpawnSkoude(data)
  local player_entity_id = GetPlayerEntity()
  if (player_entity_id == nil) then
    return
  end

  local x, y = EntityGetTransform(player_entity_id)
  x = x + (Random(1, 2) == 1 and Random(-40, -30) or Random(30, 40))
  y = y - Random(-30, 30)

  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())

  GamePrintImportant(GameTextGet("$tpi_secret_skoude_spawn", data.used_by))
	EntityLoad("data/entities/animals/necromancer_super.xml", x, y)
  return true
end

return SpawnSkoude
