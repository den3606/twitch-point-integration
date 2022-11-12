dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")

local player_entity_id = GetPlayerEntity()
if (player_entity_id == nil) then
  return
end

local x, y = EntityGetTransform(player_entity_id)
local effect_id = EntityLoad("mods/twitch-point-integration/files/entities/effect_balloon_end.xml", x, y)
EntityAddChild(player_entity_id, effect_id)
