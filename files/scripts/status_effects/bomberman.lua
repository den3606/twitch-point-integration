dofile_once("data/scripts/lib/utilities.lua")
dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")

local plyaer_entity_id = GetPlayerEntity()
local x, y = EntityGetTransform(plyaer_entity_id)
local entity_id = EntityLoad( "mods/twitch-point-integration/files/entities/bomberman.xml", x, y )

edit_component( entity_id, "ProjectileComponent", function(comp,vars)
    local herd_id   = get_herd_id( plyaer_entity_id )
    vars.mWhoShot       = plyaer_entity_id
		vars.mShooterHerdId = herd_id
	end)
	edit_component( entity_id, "VelocityComponent", function(comp,vars)
		ComponentSetValueVector2( comp, "mVelocity", 0, 0 )
	end)
  GameShootProjectile( plyaer_entity_id, x, y, x, y, entity_id, true )