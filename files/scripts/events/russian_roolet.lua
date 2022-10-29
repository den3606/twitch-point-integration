local function RussianRoolet(data, event)
  local x, y = EntityGetTransform(GetPlayerEntity())
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  if (Random(1, 666) == 666) then
    EntityLoad('mods/twitch-point-integration/files/entities/bomb_holy_giga.xml', x, y)
    KillPlayer("あなたはRussianRooletで " .. data.used_by .. " によって殺されました…")
  else
    GamePrint(data.used_by .. " がRussianRooletあなたを殺そうとしましたが、まだ死ぬときではなかったようです")
  end
  return true
end

return RussianRoolet
