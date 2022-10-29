local function HelloDeer(data, events)
  local x, y = EntityGetTransform(GetPlayerEntity())
  SetRandomSeed(x + GameGetFrameNum(), y + GameGetFrameNum())
  x = x + (Random(1, 2) == 1 and Random(-40, -10) or Random(10, 40))
  y = y - Random(10, 30)

  local deer_entity = nil
  if Random(1, 100) <= 10 then
    deer_entity = EntityLoad("data/entities/projectiles/deck/exploding_deer.xml", x, y)
  else
    deer_entity = EntityLoad("data/entities/animals/deer.xml", x, y)
  end

  local text = {
    string = data.used_by,
    offset_y = "-6",
    scale_x = "0.7",
    scale_y = "0.7",
  }
  local name_entity = EntityCreateNew("twitch_name")
  EntityAddComponent(name_entity, "InheritTransformComponent", {
    _tags = "enabled_in_world",
    use_root_parent = "1",
  })

  if EntityGetIsAlive(name_entity) == false then
    return nil
  end
  text.offset_x = string.len(text.string) * 1.9
  EntityAddComponent(name_entity, "SpriteComponent", {
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

  EntityAddChild(deer_entity, name_entity)
  EntityAddTag(deer_entity, "dont_append_name")

end

return HelloDeer
