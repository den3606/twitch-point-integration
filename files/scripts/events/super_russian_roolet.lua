local function SuperRussianRoolet(data, event)
  local x, y = EntityGetTransform(GetPlayerEntity())
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  if (Random(1, 6) == 6) then
    EntityLoad('mods/twitch-point-integration/files/entities/bomb_holy_giga.xml', x, y)
    KillPlayer("あなたはRussianRooletで " .. data.used_by .. " によって殺されました…")
  else
    GamePrint(data.used_by .. " がSuperRussianRooletあなたを殺そうとしましたが、まだ死ぬときではなかったようです")
  end
  return true
end

return SuperRussianRoolet
