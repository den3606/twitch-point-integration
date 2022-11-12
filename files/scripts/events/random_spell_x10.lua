local function RandomSpellx10(data, event)
  dofile_once("data/scripts/gun/gun_actions.lua")
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  local filtered_action = Lume.filter(actions, function(action)
    return action.related_projectiles ~= nil and action.name ~= nil
  end)
  for i = 1, 10 do
    SetRandomSeed(x + GameGetFrameNum() + i, y + GameGetFrameNum() + i)
    local selected_action = filtered_action[Random(1, #filtered_action)]
    GamePrint(GameTextGet(selected_action.name))
    EntityLoad(selected_action.related_projectiles[1], x + Random(-100, 100), y + Random(-100, 100))
  end
  return true
end

return RandomSpellx10
