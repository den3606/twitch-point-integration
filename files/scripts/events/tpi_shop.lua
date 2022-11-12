local EventHelper = dofile_once("mods/twitch-point-integration/files/scripts/event_helper.lua")

local function TPIShop(data, event)
  dofile("data/scripts/biomes/temple_shared.lua")
  dofile("data/scripts/items/generate_shop_item.lua")
  dofile_once("data/scripts/director_helpers.lua")

  local plyaer_entity_id = GetPlayerEntity()
  local x, y = EntityGetTransform(plyaer_entity_id)
  EntityLoad("mods/twitch-point-integration/files/entities/buildings/tpi_shop.xml", x + 90, y + 6)

  EntityLoad("mods/twitch-point-integration/files/entities/animals/shop_owner.xml", x + 150, y - 25)

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

return TPIShop
