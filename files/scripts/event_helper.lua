dofile_once("data/scripts/lib/utilities.lua")

local function SetLifetime(effect_id, lifetime)
  local lifetime = lifetime or 300
  local game_effects = EntityGetComponent(effect_id, "GameEffectComponent")
  local lifetimes = EntityGetComponent(effect_id, "LifetimeComponent")

  if (game_effects ~= nil) then
    for _, compoent_id in ipairs(game_effects) do
      ComponentSetValue2(compoent_id, "frames", lifetime)
    end
  end

  if (lifetimes ~= nil) then
    for _, compoent_id in ipairs(lifetimes) do
      ComponentSetValue2(compoent_id, "creation_frame", GameGetFrameNum())
      ComponentSetValue2(compoent_id, "kill_frame", GameGetFrameNum() + lifetime)
    end
  end
end

local function AddIconInHud(effect_id, icon_file, event, custom_name)
  if effect_id ~= nil then
    EntityAddComponent2(effect_id, "UIIconComponent", {
      name = custom_name or event.ui_name,
      description = event.ui_description,
      icon_sprite_file = icon_file,
      display_above_head = false,
      display_in_hud = true,
      is_perk = false,
    })
  end
end

local function ShootProjectile(who_shot, entity_file, x, y, vel_x, vel_y, send_message)
  local entity_id = EntityLoad(entity_file, x, y)
  local herd_id = get_herd_id(who_shot)
  if (send_message == nil) then
    send_message = true
  end

  GameShootProjectile(who_shot, x, y, x + vel_x, y + vel_y, entity_id, send_message)

  edit_component(entity_id, "ProjectileComponent", function(comp, vars)
    vars.mWhoShot = who_shot
    vars.mShooterHerdId = herd_id
  end)

  edit_component(entity_id, "VelocityComponent", function(comp, vars)
    ComponentSetValueVector2(comp, "mVelocity", vel_x, vel_y)
  end)

  return entity_id
end

return {
  SetLifetime = SetLifetime,
  AddIconInHud = AddIconInHud,
  ShootProjectile = ShootProjectile,
}
