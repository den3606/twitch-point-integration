local function RandomSpell(data, event)
  dofile_once("data/scripts/gun/gun_actions.lua")
  local player_entity_id = GetPlayerEntity()
  if (player_entity_id == nil) then
    return
  end
  local x, y = EntityGetTransform(player_entity_id)
  local filtered_action = Lume.filter(actions, function(action)
    return action.related_projectiles ~= nil and action.name ~= nil
  end)

  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  local selected_action = filtered_action[Random(1, #filtered_action)]
  GamePrint(GameTextGet(selected_action.name))
  EntityLoad(selected_action.related_projectiles[1], x + Random(-100, 100), y + Random(-100, 100))
  return true
end

return RandomSpell
