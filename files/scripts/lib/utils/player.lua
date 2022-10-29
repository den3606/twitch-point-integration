-- プレイヤーのEntity_idを取ってくる
function GetPlayerEntity()
  local players = EntityGetWithTag("player_unit")
  if #players == 0 then
    return
  end

  return players[1]
end

-- 呼ぶとプレイヤーが死ぬ
-- messageは死亡時の詳細テキスト(他のComponent経由でもメッセージを追加できる場合があるが、そのときはこのメッセージの前に設置されるよう)
function KillPlayer(message)
  EntityInflictDamage(GetPlayerEntity(), 999, "DAMAGE_SLICE", message, "BLOOD_EXPLOSION", 0, 0)
end

function GetPlayerHealth()
	local damagemodels = EntityGetComponent( GetPlayerEntity(), "DamageModelComponent" )
	local health = 0
	if( damagemodels ~= nil ) then
		for i,v in ipairs(damagemodels) do
			health = tonumber( ComponentGetValue( v, "hp" ) )
			break
		end
	end
	return health
end

-- function to return player max health
function GetPlayerMaxHealth()
	local damagemodels = EntityGetComponent( GetPlayerEntity(), "DamageModelComponent" )
	local maxHealth = 0
	if( damagemodels ~= nil ) then
		for i,v in ipairs(damagemodels) do

			maxHealth = tonumber( ComponentGetValue( v, "max_hp" ) )

			break
		end
	end
	return maxHealth
end


function GetWands()
  local childs = EntityGetAllChildren(GetPlayerEntity())
  local inven = nil
  if childs ~= nil then
      for _, child in ipairs(childs) do
          if EntityGetName(child) == "inventory_quick" then
              inven = child
          end
      end
  end
  local wands = {}
  if inven ~= nil then
      local items = EntityGetAllChildren(inven)
      for _, child_item in ipairs(items) do
          if EntityHasTag(child_item, "wand") then
              wands[_] = child_item
          end
      end
  end

  return wands or nil
end

function GetWandSpells(id)
  local childs = EntityGetAllChildren(id)
  local inven = {}
  if childs ~= nil then
      for _, child in ipairs(childs) do
          if EntityHasTag(child, "card_action") then
              inven[_] = child
          end
      end
  end
  return inven or nil
end