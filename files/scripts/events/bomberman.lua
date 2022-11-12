local function Bomberman(data, event)
  local plyaer_entity_id = GetPlayerEntity()
  local x, y = EntityGetTransform(plyaer_entity_id)

	local effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_bomberman.xml", x, y )
  EntityAddChild(plyaer_entity_id, effect_id)

  return true
end

return Bomberman
