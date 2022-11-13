local function random(a, b)
  if not a then a, b = 0, 1 end
  if not b then b = 0 end
  return a + math.random() * (b - a)
end

local function weightedchoice(t)
  local sum = 0
  for _, v in pairs(t) do
    assert(v >= 0, "weight value less than zero")
    sum = sum + v
  end
  assert(sum ~= 0, "all weights are zero")
  local rnd = Random(sum, 0)
  for k, v in pairs(t) do
    if rnd < v then return k end
    rnd = rnd - v
  end
end


local function RandomAll(data, events)
  local list = {}
  Lume.each(events, function(event)
    list[event.name] = event.weight
  end)

  local year, month, day, hour, minute, second = GameGetDateAndTimeLocal()
  SetRandomSeed(second + GameGetFrameNum(), second + GameGetFrameNum())
  local target_name = weightedchoice(list)

  if events[target_name] == nil then
    print("NoitaRandomAllEvent[" .. target_name .. "]: undefined")
    return true
  end

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
