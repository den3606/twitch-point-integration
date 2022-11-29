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

local function CreateDisplayNameEntity(name)
  local text = {
    string = name,
    offset_y = "-6",
    scale_x = "0.7",
    scale_y = "0.7",
  }
  local name_entity_id = EntityCreateNew("tpi_name")
  EntityAddComponent(name_entity_id, "InheritTransformComponent", {
    _tags = "enabled_in_world",
    use_root_parent = "1",
  })

  if EntityGetIsAlive(name_entity_id) == false then
    return nil
  end
  text.offset_x = string.len(text.string) * 1.9
  EntityAddComponent(name_entity_id, "SpriteComponent", {
    _tags = "enabled_in_world",
    image_file = text.font or "data/fonts/font_pixel_white.xml",
    emissive = "1",
    is_text_sprite = "1",
    offset_x = text.offset_x or "0",
    offset_y = text.offset_y or "0",
    alpha = text.alpha or "1",
    update_transform = "1",
    update_transform_rotation = "0",
    text = text.string or "",
    has_special_scale = "1",
    special_scale_x = text.scale_x or "1",
    special_scale_y = text.scale_y or "1",
    z_index = "-9000",
  })

  return name_entity_id
end

local function RandomSpawnPoint(target_x, target_y)
  SetRandomSeed(target_x + GameGetFrameNum(), target_y + GameGetFrameNum())
  local x = target_x + (Random(1, 2) == 1 and Random(-90, -60) or Random(60, 90))
  local y = target_y - Random(-30, 30)
  return x, y
end

return {
  RandomSpawnPoint = RandomSpawnPoint,
  SetLifetime = SetLifetime,
  AddIconInHud = AddIconInHud,
  CreateDisplayNameEntity = CreateDisplayNameEntity,
  ShootProjectile = ShootProjectile,
}
