local function Stretch(data, event)
  local player_entity = GetPlayerEntity()
  if (player_entity == nil) then
    return
  end
  Coil.add(function()
    local scale_size = 0.05
    local _, _, rotation, scale_x, scale_y = EntityGetTransform(player_entity)
    while (scale_y < 3.0) do
      local x, y = EntityGetTransform(player_entity)
      scale_y = scale_y + scale_size
      EntitySetTransform(player_entity, x, y, rotation, scale_x, scale_y)
      Coil.wait(1)
    end
    Coil.wait(120)
    while (scale_y >= 1.0) do
      local x, y = EntityGetTransform(player_entity)
      scale_y = scale_y - scale_size
      EntitySetTransform(player_entity, x, y, rotation, scale_x, scale_y)
      Coil.wait(1)
    end
  end)
  return true
end

return Stretch
