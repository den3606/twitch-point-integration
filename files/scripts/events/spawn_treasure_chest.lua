local function spawn_chest( x, y )
	local r = ProceduralRandom( x, y )
  SetRandomSeed( x, y )
  local rnd = Random( 1, 100 )

  if (rnd <= 90) or (y < 512 * 3) then
    rnd = Random( 1, 1000 )

    if ( rnd < 1000 ) then
      local entity = EntityLoad( "data/entities/items/pickup/chest_random.xml", x, y)
    else
      local entity = EntityLoad( "data/entities/items/pickup/chest_random_super.xml", x, y)
    end
  else
    rnd = Random( 1, 100 )

    if( rnd <= 95 ) then
      local entity = EntityLoad( "data/entities/animals/chest_mimic.xml", x, y)
    else
      local entity = EntityLoad( "data/entities/items/pickup/chest_leggy.xml", x, y)
    end
  end
end

local function SpawnTreasureChest(data)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  x = x + (Random(1, 2) == 1 and Random(-40, -30) or Random(30, 40))
  y = y - Random(-30, 30)

  spawn_chest(x, y)
  return true
end

return SpawnTreasureChest
