local Pollnet = dofile_once("mods/twitch-point-integration/files/scripts/lib/Pollnet.lua")
local ReceivedEvent = dofile_once("mods/twitch-point-integration/files/scripts/ws/received_events.lua")
-- dofile("mods/twitch-point-integration/files/scripts/append/utils.lua")

local main_socket = Pollnet.open_ws(HOST_NAME)

--- payload = {action = "route_name", params = {}}
--- @param route_name string
--- @param payload table
--- @return boolean
SocketSend = function(route_name, payload)
  local data = {
    action = route_name,
    params = payload,
  }
  if main_socket then
    if main_socket:status() == "open" then
      local succesed, encoded = pcall(Json.encode, data)
      if succesed then
        print("send_data: " .. encoded)
        main_socket:send(encoded)
        return true
      end
    end
  end
  return false
end

-- 指定回数分送信を試みる / 成功した場合は送信処理を終了する
SocketTryToSend = function(route_name, payload, try_count, wait_time, loop_end_callback)
  local default_try_count = 10
  local default_wait_time = 60
  if loop_end_callback == nil then
    loop_end_callback = function()
      return true
    end
  end
  return Coil.add(function()
    try_count = try_count or TWITCH_POINT.TRY_COUNT or default_try_count
    for i = 1, try_count, 1 do
      if SocketSend(route_name, payload) then
        if loop_end_callback() then
          break
        end
      else
        Coil.wait(wait_time or default_wait_time)
      end
    end
  end)
end

-- 送信成功の有無にかかわらず指定回数分送信する
SocketLoopSend = function(route_name, payload, sending_count, wait_time, loop_end_callback)
  local default_sending_count = 10
  local default_wait_time = 60

  if loop_end_callback == nil then
    loop_end_callback = function()
      return false
    end
  end
  return Coil.add(function()
    sending_count = sending_count or default_sending_count
    for i = 1, sending_count, 1 do
      SocketSend(route_name, payload)
      if loop_end_callback() then
        break
      end
      Coil.wait(wait_time or default_wait_time)
    end
  end)
end

SocketReceived = function(event_name, params)
  if event_name and event_name ~= '' then
    ReceivedEvent.call(event_name, params)
  end
end


Coil.add(function()
  while true do
    Coil.wait(UPDATE_RATE)
    local ok, data = main_socket:poll()
    if ok and data then
      local succesed, decoded = pcall(Json.decode, data)
      if succesed then
        print("received_data: " .. data)
        if decoded.message then
          print("error message: " .. tostring(decoded.message))
          return
        end
        SocketReceived(decoded.eventName, decoded.data)
      end
    end

    if not ok then
      Coil.wait(300)
      GamePrint("Can not connect to host. Try to reconnect...")
      main_socket = Pollnet.open_ws(HOST_NAME)
    end
  end
end)

Coil.add(function()
  while true do
    Coil.wait(6000)
    SocketSend("heartbeat", {})
  end
end)

return true
