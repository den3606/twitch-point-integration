local function RussianRoolet(data, event)
  local player_entity_id = GetPlayerEntity()

  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  if (Random(1, 666) == 666) then
    EntityLoad('mods/twitch-point-integration/files/entities/bomb_holy_giga.xml', x, y)

    KillPlayer(GameTextGet("$tpi_rusian_roolet_death_message_1", data.used_by))
  else
    GamePrint(GameTextGet("$tpi_rusian_roolet_death_message_2", data.used_by))
  end
  return true
end

return RussianRoolet
