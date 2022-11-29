local function GralleryPunch(data, event)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(GetPlayerEntity())
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  local direction = ({-1, 1})[Random(1, 2)]
  EventHelper.ShootProjectile(GetPlayerEntity(), "mods/twitch-point-integration/files/entities/projectiles/gallery_punch.xml", x, y, direction * 300, -200)
  return true
end

return GralleryPunch
