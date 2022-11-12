local function SpawnWater(data)
  local player_entity_id = GetPlayerEntity()
  if (player_entity_id == nil) then
    return
  end
  local x, y = EntityGetTransform(player_entity_id)
  EntityLoad("mods/twitch-point-integration/files/entities/call_water_left.xml", x, y - 10)
  EntityLoad("mods/twitch-point-integration/files/entities/call_water_right.xml", x, y - 10)
  return true
end

return SpawnWater
