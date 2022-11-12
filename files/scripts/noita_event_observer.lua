dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")

local events = {
  Berserk = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/berserk.lua"),
    name = "Berserk",
    twitchCost = 250,
    weight = 80,
  },
  Blindness = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/blindness.lua"),
    name = "Blindness",
    twitchCost = 400,
    weight = 70,
  },
  Bomberman = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/bomberman.lua"),
    name = "Bomberman",
    twitchCost = 200,
    weight = 90,
  },
  FungalShift = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/fungal_shift.lua"),
    name = "FungalShift",
    twitchCost = 1500,
    weight = 100,
  },
  Hello = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/hello.lua"),
    name = "Hello",
    twitchCost = 10,
    weight = 0,
  },
  HelloDeer = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/hello_deer.lua"),
    name = "HelloDeer",
    twitchCost = 50,
    weight = 120,
  },
  Healing = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/healing.lua"),
    name = "Headling",
    twitchCost = 200,
    weight = 20,
  },
  HeavySpread = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/heavy_spread.lua"),
    name = "HeavySpread",
    twitchCost = 200,
    weight = 80,
  },
  Neutralized = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/neutralized.lua"),
    name = "Neutralized",
    twitchCost = 400,
    weight = 50,
  },
  TPIShop = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/tpi_shop.lua"),
    name = "TPIShop",
    twitchCost = 400,
    weight = 40,
  },
  PotionGift = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/potion_gift.lua"),
    name = "PotionGift",
    twitchCost = 400,
    weight = 50,
  },
  RandomSpell = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/random_spell.lua"),
    name = "RandomSpell",
    twitchCost = 400,
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
    twitchCost = 1,
    weight = 150,
  },
  RandomAll = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/random_all.lua"),
    name = "RandomAll",
    twitchCost = 200,
    weight = 0,
  },
  SpawnWater = {
    action =  dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_water.lua"),
    name = "SpawnWater",
    twitchCost = 100,
    weight = 100,
  },
  Stretch = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/stretch.lua"),
    name = "Stretch",
    twitchCost = 200,
    weight = 150,
  },
  SpawnRandomEnemy = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_random_enemy.lua"),
    name = "SpawnRandomEnemy",
    twitchCost = 500,
    weight = 60,
  },
  -- secret
  SpawnSteve = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_steve.lua"),
    name = "SpawnSteve",
    twitchCost = 500,
    weight = 60,
  },
  -- secret
  SpawnSkoude = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_skoude.lua"),
    name = "SpawnSkoude",
    twitchCost = 1000,
    weight = 30,
  },
  SuperRussianRoolet = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/super_russian_roolet.lua"),
    name = "SuperRussianRoolet",
    twitchCost = 5000,
    weight = 10,
  },
  SuperRecoil = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/super_recoil.lua"),
    name = "SuperRecoil",
    twitchCost = 300,
    weight = 60,
  },
  Twitchy = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/twitchy.lua"),
    name = "Twitchy",
    twitchCost = 300,
    weight = 70,
  },
  TrailLava = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/trail_lava.lua"),
    name = "TrailLava",
    twitchCost = 300,
    weight = 80,
  },
  TrailPoison = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/trail_poison.lua"),
    name = "TrailPoison",
    twitchCost = 300,
    weight = 80,
  },
  TrailAcid = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/trail_acid.lua"),
    name = "TrailAcid",
    twitchCost = 300,
    weight = 60,
  },

  -- MovementControll = {
  --   action = dofile_once("mods/twitch-point-integration/files/scripts/events/movement_controll.lua"),
  --   name = "MovementControll",
  --   twitchCost = 200,
  --   weight = 150,
  -- },
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
