dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")
dofile_once("data/scripts/lib/utilities.lua")

local events = {
  Hello = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/hello.lua"),
    name = "Hello",
    twitchCost = 10,
    weight = 0,
  },
  Headling = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/healing.lua"),
    name = "Headling",
    twitchCost = 500,
    weight = 10,
  },
  SpawnWater = {
    action =  dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_water.lua"),
    name = "SpawnWater",
    twitchCost = 300,
    weight = 100,
  },
  PotionGift = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/potion_gift.lua"),
    name = "PotionGift",
    twitchCost = 1000,
    weight = 50,
  },
  Stretch = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/stretch.lua"),
    name = "Stretch",
    twitchCost = 300,
    weight = 150,
  },
  FungalShift = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/fungal_shift.lua"),
    name = "FungalShift",
    twitchCost = 2500,
    weight = 100,
  },
  RandomSpell = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/random_spell.lua"),
    name = "RandomSpell",
    twitchCost = 500,
    weight = 100,
  },
  RandomSpellx10 = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/random_spell_x10.lua"),
    name = "RandomSpellx10",
    twitchCost = 7500,
    weight = 10,
  },
  RussianRoolet = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/russian_roolet.lua"),
    name = "RussianRoolet",
    twitchCost = 10,
    weight = 150,
  },
  SuperRussianRoolet = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/super_russian_roolet.lua"),
    name = "SuperRussianRoolet",
    twitchCost = 5000,
    weight = 10,
  },
  RandomAll = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/random_all.lua"),
    name = "RandomAll",
    twitchCost = 300,
    weight = 0,
  },
  HelloDeer = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/hello_deer.lua"),
    name = "HelloDeer",
    twitchCost = 200,
    weight = 150,
  },
}

local function Call(event_name, event_data)
  print("NoitaEvent[" .. event_name .. "]: called")
  local successed, event_called = pcall(events[event_name].action, event_data, events)
  if successed then
    if event_called then
      print("NoitaEvent[" .. event_name .. "]: executed")
    else
      print("NoitaEvent[" .. event_name .. "]: can't executed")
    end
  else
    print("NoitaEvent[" .. event_name .. "]: failed")
  end
end

local NoitaEvent = {
  Call = Call,
}
return NoitaEvent
