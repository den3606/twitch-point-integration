local function RandomAll(data, events)
  local list = {}
  Lume.each(events, function(event)
    list[event.name] = event.weight
  end)
  local target_name = Lume.weightedchoice(list)

  local successed, event_called = pcall(events[target_name].action, data, events)
  if successed then
    if event_called then
      print("NoitaRandomAllEvent[" .. events[target_name].name .. "]: executed")
    else
      print("NoitaRandomAllEvent[" .. events[target_name].name .. "]: can't executed")
    end
  else
    print("NoitaRandomAllEvent[" .. events[target_name].name .. "]: failed")
  end

  return true
end

return RandomAll
