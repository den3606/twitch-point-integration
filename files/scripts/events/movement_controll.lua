local function MovementControl(data, events)
  local player_entity_id = GetPlayerEntity()

  if (player_entity_id == nil) then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  local effect_id = nil
  if data.message == "up" then
    effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_movement_control_up.xml", x, y )
  elseif data.message == "down" then
    effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_movement_control_down.xml", x, y )
  elseif data.message == "left" then
    effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_movement_control_left.xml", x, y )
  elseif data.message == "right" then
    effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_movement_control_right.xml", x, y )
  end

  if effect_id == nil then
    SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
    local rand = Random(1, 4)
    if rand == 1 then
      effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_movement_control_up.xml", x, y )
    elseif rand == 2 then
      effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_movement_control_down.xml", x, y )
    elseif rand == 3 then
      effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_movement_control_left.xml", x, y )
    else
      effect_id = EntityLoad( "mods/twitch-point-integration/files/entities/effect_movement_control_right.xml", x, y )
    end
  end

  EntityAddChild(player_entity_id, effect_id)

  return true
end

return MovementControl
