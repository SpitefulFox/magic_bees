
function define_items()
  api_define_object({
    id = "toadstool",
    name = "Toadstool",
    category = "Mushroom",
    tooltip = "A cute toadstool! Just avoid any rings.",
    shop_buy = 5,
    shop_sell = 1,
    tools = { "mouse1" },
    place_grass = true,
    has_shadow = true,
    pickable = false
  }, "sprites/toadstool.png")
  
  api_define_wall({
    id = "701",
    name = "Runed Wall",
    shop_buy = 2,
    shop_sell = 0.5
  }, "sprites/rune_wall_sprite.png")
  
  api_define_object({
    id = "mysterious_shadow",
    name = "Mysterious Shadow",
    category = "???",
    tooltip = "It's too dark to see!",
    tools = {},
    has_shadow = false,
    pickable = false
  }, "sprites/shadow_hive.png")
  
  api_define_item({
    id = "fairy_dust",
    name = "Fairy Dust",
    category = "Beekeeping",
    tooltip = "Produced by Fair bees, can be sold for Rubees!",
    bee_lore = "A light, shimmering pollen that smells like sugarplums. It's believed to have magical powers and is used by many ritualists.",
    shop_buy = 2,
    shop_sell = 1.5
  }, "sprites/fairy_dust.png")
  
  api_define_item({
    id = "magical_wax",
    name = "Magical Wax",
    category = "Beekeeping",
    tooltip = "Produced by Enchanted bees, can be sold for Rubees!",
    bee_lore = "A pretty blue wax highly valued by wizards and candle makers.",
    shop_buy = 2,
    shop_sell = 1.5
  }, "sprites/magical_wax.png")
  
  api_define_item({
    id = "shadow_oil",
    name = "Shadow Oil",
    category = "Beekeeping",
    tooltip = "Produced by Shadow bees, can be sold for Rubees!",
    bee_lore = "A dark, oily residue valued for making ink.",
    shop_buy = 10,
    shop_sell = 2
  }, "sprites/shadow_oil.png")
  
  api_define_item({
    id = "rune_shard",
    name = "Rune Shard",
    category = "Beekeeping",
    tooltip = "Produced by Runic bees, can be sold for Rubees!",
    bee_lore = "A shard of clay with a luminescent symbol carved in it by random bee scratchings. Some people like to throw handfuls of them as a form of divination.",
    shop_buy = 10,
    shop_sell = 2
  }, "sprites/rune_shard.png")
  
  --Did you know the game freaks out if your item has "mead" in the name?
  api_define_item({
    id = "fairy_cola",
    name = "Enchanted Apicola",
    category = "Liquids",
    tooltip = "Has a sweet, fruity flavor, but no special effects.|Can be sold for Rubees!",
    shop_buy = 28,
    shop_sell = 20
  }, "sprites/fairy_mead.png")
  
  api_define_item({
    id = "shadow_cola",
    name = "Enchanted Apicola",
    category = "Liquids",
    tooltip = "Has a very tart, yet sweet, flavor, but no special effects.|Can be sold for Rubees!",
    shop_buy = 28,
    shop_sell = 20
  }, "sprites/shadow_mead.png")
  
  -- api_define_item({
    -- id = "rune_arc",
    -- name = "Rune Arc",
    -- category = "Soulsborne",
    -- tooltip = "???|Produced by Elden bees, can be sold for Rubees!",
    -- shop_buy = 10,
    -- shop_sell = 2
  -- }, "sprites/rune_arc.png")
  -- add the item to the workbench as a recipe
  --recipe = {
    --{ item = "log", amount = 10 },
    --{ item = "waterproof", amount = 20 },
    --{ item = "glue", amount = 5 }
  --}
  --res = api_define_recipe("tools", MOD_NAME .. "_cool_axe", recipe, 1)
end

function define_npc()

  --set npc definition
  wiz_def = {
    id = 701,
    name = "Buzzriel",
    pronouns = "He/They",
    tooltip = "BEEHOLD!",
    shop = true,
    walking = true,
    stock = {"magic_bees_magic_circle", "wall701", "magic_bees_fairy_dust", "magic_bees_toadstool", "magic_bees_magical_wax", "log", "log", "log", "log", "log"}, -- max 10
    specials = {"magic_bees_fairy_dust", "unstabledust", "spice4"}, -- must be 3
    dialogue = {
      "Hark, beekeeper! I wish ye good fortune in your noble quest!"
    },
    greeting = "Beehold! It is I, Buzzriel! Magister of the Nine Hives and Anciente Sorcerer of The Honeyed Artes!"
  }

  -- define npc
  api_define_npc(wiz_def,
    "sprites/npc_wizard_standing.png",
    "sprites/npc_wizard_standing_h.png",
    "sprites/npc_wizard_walking.png",
    "sprites/npc_wizard_walking_h.png",
    "sprites/npc_wizard_head.png",
    "sprites/npc_wizard_bust.png",
    "sprites/npc_wizard_item.png",
    "sprites/npc_wizard_dialogue_menu.png",
    "sprites/npc_wizard_shop_menu.png"
  )

end

-- define a fake book menu obj
-- function define_book()
  -- -- define a new item
  -- -- this will give us a way to open our book when we want to
  -- api_define_item({
    -- id = "my_book_item",
    -- name = "My Book",
    -- category = "Books",
    -- tooltip = "Right-click to open!",
    -- shop_key = true,
    -- shop_buy = 0,
    -- shop_sell = 0,
    -- singular = true
  -- }, "sprites/book_item.png")
  -- -- define new menu object
  -- -- this will act as our books "menu"
  -- api_define_menu_object({
    -- id = "my_book",
    -- name = "My Book",
    -- category = "Books",
    -- tooltip = "This is my cool book",
    -- shop_key = false,
    -- shop_buy = 0,
    -- shop_sell = 0,
    -- center = true,
    -- invisible = true,
    -- layout = {},
    -- buttons = {"Close"},
    -- info = {},
    -- tools = {"mouse1", "hammer1"},
    -- placeable = true
  -- }, "sprites/book_item.png", "sprites/book_menu.png", {
    -- define = "book_define", -- defined below as a function
    -- draw = "book_draw" -- defined below as a function
  -- })
  -- -- finally, this will add our book to the library bar on the bottom
  -- api_library_add_book("my_sweet_book", "book_open", "sprites/book_button.png")
-- end


-- -- function called when clicking the library book button
-- function book_open()
  -- api_toggle_menu(MY_BOOK_MENU, true)
-- end


-- -- define the book
-- function book_define(menu_id) 
  -- -- set the menu object to immortal so it's never deactivated
  -- obj_id = api_get_menus_obj(menu_id)
  -- immortal = api_set_immortal(obj_id, true)
  -- -- set to global for later
  -- MY_BOOK_MENU = menu_id
  -- MY_BOOK_OBJ = obj_id
-- end


-- -- draw our book, called in the gui() hook
-- function book_draw(menu_id)

  -- -- draw something on top!
  -- menu = api_get_inst(menu_id)
  -- cam = api_get_cam()
  -- mx = menu["x"] - cam["x"]
  -- my = menu["y"] - cam["y"]

  -- -- draw the menu
  -- api_draw_sprite(menu["sprite_index"], 0, mx, my)

  -- -- draw some text
  -- api_draw_text(mx + 6, my + 4, "Hello World!", false, "FONT_BOOK")

-- end