local function RandomAll(data, events)
  local list = {}
  Lume.each(events, function(event)
    list[event.name] = event.weight
  end)
  local target_name = Lume.weightedchoice(list)
  events[target_name].action(data, events)
  return true
end

return RandomAll
