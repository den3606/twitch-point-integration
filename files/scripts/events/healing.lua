local function Headling(data, event)
  local player_entity = GetPlayerEntity()
  if (player_entity == nil) then
    return
  end
  local x, y = EntityGetTransform(player_entity)
  EntityLoad("data/entities/projectiles/deck/regeneration_field.xml", x, y)
end

return Headling
