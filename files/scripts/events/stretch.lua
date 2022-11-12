local function Stretch(data, event)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  if (player_entity_id == nil) then
    return
  end

  local x, y = EntityGetTransform(player_entity_id)
  local effect_id = EntityLoad("mods/twitch-point-integration/files/entities/effect_stretch.xml", x, y)
  EntityAddChild(player_entity_id, effect_id)

  Coil.add(function()
    local scale_size = 0.05
    local _, _, rotation, scale_x, scale_y = EntityGetTransform(player_entity_id)
    while (scale_y < 3.0) do
      local x, y = EntityGetTransform(player_entity_id)
      scale_y = scale_y + scale_size
      EntitySetTransform(player_entity_id, x, y, rotation, scale_x, scale_y)
      Coil.wait(1)
    end
    Coil.wait(520)
    while (scale_y >= 1.0) do
      local x, y = EntityGetTransform(player_entity_id)
      scale_y = scale_y - scale_size
      EntitySetTransform(player_entity_id, x, y, rotation, scale_x, scale_y)
      Coil.wait(1)
    end
  end)

  return true
end

return Stretch
