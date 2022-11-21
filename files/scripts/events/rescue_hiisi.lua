local function RescueHiisi(data, event)
  dofile_once("data/scripts/lib/utilities.lua")
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  local x, y = EntityGetTransform(player_entity_id)
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  x = x + (Random(1, 2) == 1 and Random(-40, -10) or Random(10, 40))
  y = y - Random(10, 30)
  local healer_entity_id = EntityLoad("mods/twitch-point-integration/files/entities/animals/rescue_hiisi.xml", x, y)

  edit_component(healer_entity_id, "LuaComponent", function(comp, vars)
    vars.script_death = ""
  end)

  GetGameEffectLoadTo(healer_entity_id, "CHARM", true)
  EntityAddChild(healer_entity_id, EventHelper.CreateDisplayNameEntity(data.used_by))
  return true
end

return RescueHiisi
