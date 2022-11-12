local function Stretch(data, event)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  local effect_id = EntityLoad("mods/twitch-point-integration/files/entities/effect_stretch.xml", x, y)
  EntityAddChild(player_entity_id, effect_id)

  -- Note:
  -- Coilでコルーチンの非同期処理を行っており、その中で継続的に処理が走るため、player_entity_idが消失した場合でも走り続けている可能性がある
  -- Entityファイルのlifetimeでwhile処理をかけられるように（Coilを排除できるように）修正した方が良い。
  -- Coil.add(function()
  --   local scale_size = 0.05
  --   local _, _, rotation, scale_x, scale_y = EntityGetTransform(player_entity_id)
  --   if scale_x == nil or scale_y == nil or scale_size == nil then
  --     return
  --   end
  --   while (scale_y < 3.0) do
  --     local x, y = EntityGetTransform(player_entity_id)
  --     scale_y = scale_y + scale_size
  --     EntitySetTransform(player_entity_id, x, y, rotation, scale_x, scale_y)
  --     Coil.wait(1)
  --   end
  --   Coil.wait(520)
  --   while (scale_y >= 1.0) do
  --     local x, y = EntityGetTransform(player_entity_id)
  --     scale_y = scale_y - scale_size
  --     EntitySetTransform(player_entity_id, x, y, rotation, scale_x, scale_y)
  --     Coil.wait(1)
  --   end
  -- end)

  return true
end

return Stretch
