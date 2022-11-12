local function Healing(data, event)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  EntityLoad("data/entities/projectiles/deck/regeneration_field.xml", x, y)

  return true
end

return Healing
