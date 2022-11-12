local function Bomberman(data, event)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)

	local effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_bomberman.xml", x, y )
  EntityAddChild(player_entity_id, effect_id)

  return true
end

return Bomberman
