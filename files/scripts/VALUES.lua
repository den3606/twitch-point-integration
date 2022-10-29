TWITCH_POINT = {
  VERSION = "0.0.1",
  TRY_COUNT = 10,
  STEPS = {
    -- valueを保存する際はstringなので、numberにしていない
    UNINITIALISED = "1",
    WAITING_FOR_CONNECTION = "2",
    CONNECTED = "3"
  },
  GLOBAL_KEYNAMES = {
    CURRENT_STEP = "twitch-point-integration.current_step"
  },
  MOD_KEYNAMES = {
    CHANNEL_NAME = "twitch-point-integration.channelName",
    HOST_NAME = "twitch-point-integration.hostName",
    UPDATE_RATE = "twitch-point-integration.updateRate"
  },
}

return TWITCH_POINT
