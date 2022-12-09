local function RescueHiisi(data, event)
  local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")
  local player_entity_id = GetPlayerEntity()
  local x, y = EntityGetTransform(player_entity_id)

  EventHelper.RandomPositionSpawn(x, y, 5, 5, 30, 30, function(target_x, target_y)
    local healer_entity_id = EntityLoad("mods/twitch-point-integration/files/entities/animals/rescue_hiisi.xml", target_x, target_y)
    dofile_once("data/scripts/lib/utilities.lua")
    edit_component(healer_entity_id, "LuaComponent", function(comp, vars)
      vars.script_death = ""    end)

    GetGameEffectLoadTo(healer_entity_id, "CHARM", true)
    EntityAddChild(healer_entity_id, EventHelper.CreateDisplayNameEntity(data.used_by))
  end)

  return true
end

return RescueHiisi
