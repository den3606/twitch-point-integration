local function printEventName(name)
  print("Event[" .. name .. "]: called")
end

local function Join(channel_name)
  if GlobalsGetValue(TWITCH_POINT.GLOBAL_KEYNAMES.CURRENT_STEP, TWITCH_POINT.STEPS.UNINITIALISED) ~= TWITCH_POINT.STEPS.UNINITIALISED then
    return
  end

  printEventName("Join")

  SocketTryToSend("joinClient", {
    channel_name = channel_name,
  })
  GamePrint("Connecting...")
  GlobalsSetValue(TWITCH_POINT.GLOBAL_KEYNAMES.CURRENT_STEP, TWITCH_POINT.STEPS.WAITING_FOR_CONNECTION)
end

local function StartToMatchMaking(player)
  printEventName("StartToMatchMaking")
  SocketTryToSend("matchmaking", {
    player = player,
  }, 10, 4)
  GamePrint("Seach players ...")
end

local Event = {
  Join = Join,
  StartToMatchMaking = StartToMatchMaking,
}

return Event

