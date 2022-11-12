local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function SuperRecoil(data, event)
  local plyaer_entity_id = GetPlayerEntity()
  local x, y = EntityGetTransform(GetPlayerEntity())
  local effect_id = EntityLoad("mods/twitch-point-integration/files/entities/effect_super_recoil.xml", x, y)
  EntityAddChild(plyaer_entity_id, effect_id)

  EventHelper.AddIconInHud(effect_id, "data/ui_gfx/gun_actions/knockback.png", {
    ui_name = "$tpi_super_recoil",
    ui_description = "$tpi_super_recoil_description",
  })

  return true
end

return SuperRecoil
