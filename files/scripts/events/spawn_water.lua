local function SpawnWater(data)
  local player_entity = GetPlayerEntity()
  if (player_entity == nil) then
    return
  end
  local x, y = EntityGetTransform(player_entity)
  EntityLoad("mods/twitch-point-integration/files/entities/call_water_left.xml", x, y - 10)
  EntityLoad("mods/twitch-point-integration/files/entities/call_water_right.xml", x, y - 10)
  return true
end

return SpawnWater
