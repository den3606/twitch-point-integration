dofile_once("data/scripts/lib/utilities.lua")
dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")

local player_entity_id = GetPlayerEntity()
if (player_entity_id == nil) then
  return
end

local x, y = EntityGetTransform(player_entity_id)
local entity_id = EntityLoad( "mods/twitch-point-integration/files/entities/bomberman.xml", x, y )

edit_component( entity_id, "ProjectileComponent", function(comp,vars)
    local herd_id   = get_herd_id( player_entity_id )
    vars.mWhoShot       = player_entity_id
		vars.mShooterHerdId = herd_id
	end)
	edit_component( entity_id, "VelocityComponent", function(comp,vars)
		ComponentSetValueVector2( comp, "mVelocity", 0, 0 )
	end)
  GameShootProjectile( player_entity_id, x, y, x, y, entity_id, true )
