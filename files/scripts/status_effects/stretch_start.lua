dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")

print("stretch_start")

local player_entity_id = GetPlayerEntity()
if (player_entity_id == nil) then
  return
end

local scale_size = 0.05

local _, _, rotation, scale_x, scale_y = EntityGetTransform(player_entity_id)
if (scale_y < 3.0) then
  local x, y = EntityGetTransform(player_entity_id)
  scale_y = scale_y + scale_size
  EntitySetTransform(player_entity_id, x, y, rotation, scale_x, scale_y)
end
