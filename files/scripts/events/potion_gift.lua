local function PotionGift(data, event)
  local player_entity_id = GetPlayerEntity()
  if (player_entity_id == nil) then
    return
  end

  local x, y = EntityGetTransform(player_entity_id)
  SetRandomSeed(x, y)
  if Random(0, 100) < 5 then
    EntityLoad("data/entities/items/pickup/potion.xml", x + Random(-30, 30), y + Random(-30, 30))
    EntityLoad("data/entities/items/pickup/potion.xml", x + Random(-30, 30), y + Random(-30, 30))
    EntityLoad("data/entities/items/pickup/potion.xml", x + Random(-30, 30), y + Random(-30, 30))
  elseif Random(0, 100) < 10 then
    EntityLoad("data/entities/items/pickup/potion.xml", x + Random(-30, 30), y + Random(-30, 30))
    EntityLoad("data/entities/items/pickup/potion.xml", x + Random(-30, 30), y + Random(-30, 30))
  else
    EntityLoad("data/entities/items/pickup/potion.xml", x + Random(-30, 30), y + Random(-30, 30))
  end
  return true
end

return PotionGift
