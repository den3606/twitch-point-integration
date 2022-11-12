print("twitch-point-integration load")

dofile_once("mods/twitch-point-integration/files/scripts/lib/utilities.lua")
Coil = dofile("mods/twitch-point-integration/files/scripts/lib/coil/coil.lua")
Lume = dofile_once("mods/twitch-point-integration/files/scripts/lib/lume/lume.lua")
Json = dofile_once("mods/twitch-point-integration/files/scripts/lib/jsonlua/json.lua")
NoitaEvent = dofile_once("mods/twitch-point-integration/files/scripts/noita_event_observer.lua")
TWITCH_POINT = dofile_once("mods/twitch-point-integration/files/scripts/VALUES.lua")
HOST_NAME = ModSettingGet(TWITCH_POINT.MOD_KEYNAMES.HOST_NAME) or ""
UPDATE_RATE = tonumber(ModSettingGet(TWITCH_POINT.MOD_KEYNAMES.UPDATE_RATE))
NOITA_TASKS = {
  -- {event_name[string], event_name = { used_by, message }}
}
local SendEvent = dofile_once("mods/twitch-point-integration/files/scripts/ws/send_events.lua")
local channel_name = ModSettingGet(TWITCH_POINT.MOD_KEYNAMES.CHANNEL_NAME) or ""
local loaded_ws = false

if channel_name == "" then
  channel_name = nil
end
if HOST_NAME == "" then
  HOST_NAME = nil
else
  HOST_NAME = "wss://" .. HOST_NAME
end

if UPDATE_RATE < 1 then
  UPDATE_RATE = 1
end

local function empty_name_announcement()
  Coil.add(function()
    while not channel_name do
      GamePrint("Please set the name of the mod option")
      Coil.wait(120)
    end
    while not HOST_NAME do
      GamePrint("Please set the host name of the mod option")
      Coil.wait(120)
    end
  end)
end

local function noita_event_fire()
  if Lume.count(NOITA_TASKS) ~= 0 then
    local task = Lume.first(NOITA_TASKS)
    NoitaEvent.Call(task.event_name, task.event_data)
    table.remove(NOITA_TASKS, 1)
  end
end

local function game_start()
  local controls_component = EntityGetFirstComponent(GetPlayerEntity(), "ControlsComponent")
  if (controls_component ~= nil) then
    ComponentSetValue2(controls_component, "enabled", true)
    GamePrintImportant(GameTextGetTranslatedOrNot("$tpi_game_start"),"","data/ui_gfx/decorations/tab_selected.png")
    GlobalsSetValue(TWITCH_POINT.GLOBAL_KEYNAMES.CURRENT_STEP, TWITCH_POINT.STEPS.STARTED)
  end
end

local function noita_event_debug()
  local function add_events()
    -- Lume.push(NOITA_TASKS, {event_name = "AntiGravity", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "Balloon", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "Berserk", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "Blindness", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "Bomberman", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "FungalShift", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "Healing", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "HeavySpread", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "HelloDeer", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "Hello", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "MovementControll", event_data = { used_by = 'noita', message = 'testMessage' }}) -- Note: unimplemented
    -- Lume.push(NOITA_TASKS, {event_name = "Neutralized", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "PotionGift", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "RandomAll", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "RandomSpellx10", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "RandomSpell", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "RussianRoolet", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "SpawnRandomEnemy", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "SpawnSkoude", event_data = { used_by = 'noita', message = 'testMessage' }}) --secret
    -- Lume.push(NOITA_TASKS, {event_name = "SpawnSteve", event_data = { used_by = 'noita', message = 'testMessage' }}) --secret
    -- Lume.push(NOITA_TASKS, {event_name = "SpawnWater", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "Stretch", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "SuperRecoil", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "SuperRussianRoolet", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "TPIShop", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "TrailAcid", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "TrailLava", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "TrailPoison", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "TrailWater", event_data = { used_by = 'noita', message = 'testMessage' }})
    -- Lume.push(NOITA_TASKS, {event_name = "Twitchy", event_data = { used_by = 'noita', message = 'testMessage' }})
  end

  -- add_events()   -- once
  -- Coil.add(function() while true do Coil.wait(60) add_events() end end)   -- Loop
end

function OnPlayerSpawned(player_entity_id)
  GlobalsSetValue(TWITCH_POINT.GLOBAL_KEYNAMES.CURRENT_STEP, TWITCH_POINT.STEPS.UNINITIALISED)
  if HOST_NAME then
    loaded_ws = dofile("mods/twitch-point-integration/files/scripts/ws/ws.lua")
  end
  local controls_component = EntityGetFirstComponent(GetPlayerEntity(), "ControlsComponent")
  if (controls_component ~= nil) then
    ComponentSetValue2(controls_component, "enabled", false)
  end
  empty_name_announcement()
  noita_event_debug()
end

function OnWorldPreUpdate()
  Coil.update(1)
  noita_event_fire()

  if tonumber(TWITCH_POINT.STEPS.CONNECTED) == tonumber(GlobalsGetValue(TWITCH_POINT.GLOBAL_KEYNAMES.CURRENT_STEP, TWITCH_POINT.STEPS.UNINITIALISED)) then
    game_start()
  end
end

function OnWorldPostUpdate()
  if (not HOST_NAME) or (not channel_name) then
    return
  end

  if loaded_ws and channel_name then
    SendEvent.Join(channel_name)
  end
end

ModLuaFileAppend("data/scripts/gun/gun_extra_modifiers.lua", "mods/twitch-point-integration/files/scripts/append/gun_extra_modifiers.lua")

local content = ModTextFileGetContent("data/translations/common.csv")
local tpi_content = ModTextFileGetContent("mods/twitch-point-integration/files/translations/common.csv")
ModTextFileSetContent("data/translations/common.csv", content .. tpi_content)

print("twitch-point-integration loaded")
