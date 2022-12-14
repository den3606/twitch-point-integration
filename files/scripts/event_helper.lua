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

---@param pivot_x number
---@param pivot_y number
---@param dist_x number
---@param dist_y number
---@param range_x number
---@param range_y number
---@param spawn_action function
local function RandomPositionSpawn(pivot_x, pivot_y, dist_x, dist_y, range_x, range_y, spawn_action)
  if (not pivot_x) or (not pivot_y) then
    print('please set pivot x and y')
    return
  end

  dist_x = dist_x or 0
  dist_y = dist_y or 0
  range_x = range_x or 0
  range_y = range_y or 0

  Coil.add(function()
    local can_spawn = false
    while (not can_spawn) do
      SetRandomSeed(pivot_x + GameGetFrameNum(), pivot_y + GameGetFrameNum())
      local target_x = pivot_x + (Random(1, 2) == 1 and Random(-(dist_x + range_x), -dist_x) or Random(dist_x, dist_x + range_x))
      local target_y = pivot_y - (Random(1, 2) == 1 and Random(-(dist_y + range_y), -dist_y) or Random(dist_y, dist_y + range_y))

      local is_hit_up = Raytrace(target_x, target_y, target_x, target_y - 5)
      local is_hit_down = Raytrace(target_x, target_y, target_x, target_y + 1)
      local is_hit_left = Raytrace(target_x, target_y, target_x - 2, target_y)
      local is_hit_right = Raytrace(target_x, target_y, target_x + 2, target_y)

      can_spawn = not (is_hit_up or is_hit_down or is_hit_left or is_hit_right)
      if can_spawn then
        if type(spawn_action) == 'function' then
          spawn_action(target_x, target_y)
        end
      end
      Coil.wait(1)
    end
  end)

  return true
end

return {
  RandomPositionSpawn = RandomPositionSpawn,
  SetLifetime = SetLifetime,
  AddIconInHud = AddIconInHud,
  CreateDisplayNameEntity = CreateDisplayNameEntity,
  ShootProjectile = ShootProjectile,
}
