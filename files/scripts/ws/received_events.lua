local function Joined(data)
  GamePrint("Connected")
  GlobalsSetValue(TWITCH_POINT.GLOBAL_KEYNAMES.CURRENT_STEP, TWITCH_POINT.STEPS.CONNECTED)
  return true
end

local function EventInvoked(data)
  GamePrint("Event[" .. data.event_name .. "] invoked from " .. data.event_data.user_login)
  Lume.push(NOITA_TASKS, {
    event_name = data.event_name,
    event_data = {
      used_by = data.event_data.user_login,
      message = data.event_data.user_input
    }
  })
  return true
end

-- {error = { message = "error message" } }
local function HasError(data)
  GamePrint("An error has occurred.")
  local error = data.error
  GamePrint(error.message)
  return false
end

local function Heartbeat()
  p('pong')
  return true
end

local events = {
  Joined = Joined,
  EventInvoked = EventInvoked,
  HasError = HasError,
  Heartbeat = Heartbeat
}

local function call(event_name, data)
  print("Event[" .. event_name .. "]: called")

  if events[event_name] == nil then
    print("Event[" .. event_name .. "]: undefined")
    return
  end

  local successed, event_called = pcall(events[event_name], data)
  if successed then
    if event_called then
      print("Event[" .. event_name .. "]: executed")
    else
      print("Event[" .. event_name .. "]: can't executed")
    end
  else
    print("Event[" .. event_name .. "]: failed")
  end
end

local Event = {
  call = call,
}
return Event
