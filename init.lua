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
    table.remove(NOITA_TASKS)
  end
end

function OnPlayerSpawned(player_entity_id)
  GlobalsSetValue(TWITCH_POINT.GLOBAL_KEYNAMES.CURRENT_STEP, TWITCH_POINT.STEPS.UNINITIALISED)
  if HOST_NAME then
    loaded_ws = dofile("mods/twitch-point-integration/files/scripts/ws/ws.lua")
  end
  empty_name_announcement()
end

function OnWorldPreUpdate()
  Coil.update(1)
  noita_event_fire()
end

function OnWorldPostUpdate()
  if (not HOST_NAME) or (not channel_name) then
    return
  end

  if loaded_ws and channel_name then
    SendEvent.Join(channel_name)
  end
end

print("twitch-point-integration loaded")
