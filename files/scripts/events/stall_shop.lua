local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function loadShopOwner(x, y)
  local shop_owner_entity_id = EntityLoad("mods/twitch-point-integration/files/entities/animals/shop_owner.xml", x + 150, y - 25)
  local text = {
    string = 'Shop Owner',
    offset_y = "-6",
    scale_x = "0.7",
    scale_y = "0.7",
  }
  local name_entity = EntityCreateNew("stall_shop_owner_name")
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

  EntityAddChild(shop_owner_entity_id, name_entity)
  EntityAddTag(shop_owner_entity_id, "dont_append_name")
end

local function StallShop(data, event)
  dofile("data/scripts/biomes/temple_shared.lua")
  dofile("data/scripts/items/generate_shop_item.lua")
  dofile_once("data/scripts/director_helpers.lua")

  local player_entity_id = GetPlayerEntity()

  if player_entity_id == nil then
    return false
  end

  local x, y = EntityGetTransform(player_entity_id)
  EntityLoad("mods/twitch-point-integration/files/entities/buildings/stall_shop.xml", x + 90, y + 6)

  loadShopOwner(x, y)

  x = x + 20
  y = y - 10
  SetRandomSeed(x, y)
  local count = tonumber(GlobalsGetValue("TEMPLE_SHOP_ITEM_COUNT", "5"))
  local width = 132
  local item_width = width / count

  for i = 1, count do
    generate_shop_item(x + (i - 1) * item_width, y, false, nil, false)
    generate_shop_item(x + (i - 1) * item_width, y - 30, false, nil, false)
    LoadPixelScene("data/biome_impl/temple/shop_second_row.png", "data/biome_impl/temple/shop_second_row_visual.png", x + (i - 1) * item_width - 8, y - 22, "", true)
  end

  return true
end

return StallShop
