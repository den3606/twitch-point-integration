dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")

local player_entity_id = GetPlayerEntity()
if (player_entity_id == nil) then
  return
end

local character_data_component = EntityGetFirstComponentIncludingDisabled(player_entity_id, "CharacterDataComponent")
ComponentSetValue2(character_data_component, "mVelocity", 0, 45)
