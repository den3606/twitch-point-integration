dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")

local events = {
  AntiGravity = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/anti_gravity.lua"),
    name = "AntiGravity",
    level = 4,
    weight = 80,
  },
  Balloon = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/balloon.lua"),
    name = "Balloon",
    level = 8,
    weight = 60,
  },
  Berserk = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/berserk.lua"),
    name = "Berserk",
    level = 6,
    weight = 80,
  },
  Blindness = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/blindness.lua"),
    name = "Blindness",
    level = 7,
    weight = 70,
  },
  Bomberman = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/bomberman.lua"),
    name = "Bomberman",
    level = 6,
    weight = 90,
  },
  FungalShift = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/fungal_shift.lua"),
    name = "FungalShift",
    level = 6,
    weight = 100,
  },
  GalleryPunch = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/gallery_punch.lua"),
    name = "GalleryPunch",
    level = 4,
    weight = 100,
  },
  Healing = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/healing.lua"),
    name = "Healing",
    level = 0,
    weight = 40,
  },
  HeavySpread = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/heavy_spread.lua"),
    name = "HeavySpread",
    level = 7,
    weight = 80,
  },
  HelloDeer = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/hello_deer.lua"),
    name = "HelloDeer",
    level = 2,
    weight = 120,
  },
  Hello = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/hello.lua"),
    name = "Hello",
    level = 1,
    weight = 0,
  },
  KusozakoBomb = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/kusozako_bomb.lua"),
    name = "KusozakoBomb",
    level = 3,
    weight = 110,
  },
  MovementControl = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/movement_control.lua"),
    name = "MovementControl",
    level = 9,
    weight = 60,
  },
  Neutralized = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/neutralized.lua"),
    name = "Neutralized",
    level = 8,
    weight = 50,
  },
  PotionGift = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/potion_gift.lua"),
    name = "PotionGift",
    level = 6,
    weight = 70,
  },
  RandomAll = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/random_all.lua"),
    name = "RandomAll",
    level = 7,
    weight = 0,
  },
  RandomSpellx10 = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/random_spell_x10.lua"),
    name = "RandomSpellx10",
    level = 10,
    weight = 10,
  },
  RandomSpell = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/random_spell.lua"),
    name = "RandomSpell",
    level = 6,
    weight = 100,
  },
  RescueHiisi = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/rescue_hiisi.lua"),
    name = "RescueHiisi",
    level = 0,
    weight = 50,
  },
  RussianRoolet = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/russian_roolet.lua"),
    name = "RussianRoolet",
    level = 1,
    weight = 150,
  },
  SpawnRandomEnemy = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_random_enemy.lua"),
    name = "SpawnRandomEnemy",
    level = 7,
    weight = 60,
  },
  -- secret
  SpawnSkoude = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_skoude.lua"),
    name = "SpawnSkoude",
    level = 9,
    weight = 30,
  },
  -- secret
  SpawnSteve = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_steve.lua"),
    name = "SpawnSteve",
    level = 8,
    weight = 60,
  },
  SpawnTreasureChest = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_treasure_chest.lua"),
    name = "SpawnTreasureChest",
    level = 1,
    weight = 80,
  },
  SpawnWater = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/spawn_water.lua"),
    name = "SpawnWater",
    level = 2,
    weight = 100,
  },
  Stretch = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/stretch.lua"),
    name = "Stretch",
    level = 1,
    weight = 150,
  },
  SuperKusozakoBomb = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/super_kusozako_bomb.lua"),
    name = "SuperKusozakoBomb",
    level = 3,
    weight = 80,
  },
  SuperRecoil = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/super_recoil.lua"),
    name = "SuperRecoil",
    level = 4,
    weight = 60,
  },
  SuperRussianRoolet = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/super_russian_roolet.lua"),
    name = "SuperRussianRoolet",
    level = 9,
    weight = 10,
  },
  StallShop = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/stall_shop.lua"),
    name = "StallShop",
    level = 5,
    weight = 40,
  },
  TrailAcid = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/trail_acid.lua"),
    name = "TrailAcid",
    level = 7,
    weight = 70,
  },
  TrailLava = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/trail_lava.lua"),
    name = "TrailLava",
    level = 7,
    weight = 70,
  },
  TrailPoison = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/trail_poison.lua"),
    name = "TrailPoison",
    level = 6,
    weight = 80,
  },
  TrailWater = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/trail_water.lua"),
    name = "TrailWater",
    level = 4,
    weight = 80,
  },
  Twitchy = {
    action = dofile_once("mods/twitch-point-integration/files/scripts/events/twitchy.lua"),
    name = "Twitchy",
    level = 7,
    weight = 70,
  },
}

local function Call(event_name, event_data)
  print("NoitaEvent[" .. event_name .. "]: called")

  if events[event_name] == nil then
    print("NoitaEvent[" .. event_name .. "]: undefined")
    return
  end

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
