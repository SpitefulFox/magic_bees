
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


-- define a new bee and a new bee trait
function define_bees()
  -- setup bee_definition 
  fair_bee = {
    id = "fair",
    title = "Fair",
    latin = "Apis Formosus",
    hint = "Old stories say Apis Communia that tarry too long in a circle of toadstools will have their offspring stolen and replaced by the Fair Bees.",
    desc = "A bee long thought to be a tale to scare small children, the Fair Bee gathers under mushrooms and throws little tea parties.",
    lifespan = {"Short", "Normal", "Long" },
    productivity = {"Slow", "Normal"},
    fertility = {"Unlucky", "Fertile", "Fecund"},
    stability = {"Erratic", "Unstable"},
    behaviour = {"Diurnal"},
    climate = {"Temperate"},
    rainlover = false,
    snowlover = false,
    grumpy = false,
    produce = "magic_bees_fairy_dust",
    recipes = {},
    calming = {},
    chance = 100,
    bid = "mF",
    requirement = ""
  }
  
  api_define_bee(fair_bee, 
    "sprites/fair_bee_item.png", "sprites/fair_bee_shiny.png", 
    "sprites/fair_bee_hd.png",
    {r=255, g=142, b=236},
    "sprites/fair_bee_mag.png",
    "Flying straight out of a fairy tale, the Fair Bees have been repopulated by the apiarist that may be called " .. api_get_property(api_get_player_instance(), "name") .. "!",
    "Archipelago residents have taken to leaving bowls of sugar water on their doorsteps as offerings."
  )
  
  enchanted_bee = {
    id = "enchanted",
    title = "Enchanted",
    latin = "Apis Incantatus",
    hint = "Legends say a disgruntled apprentice enchanted Apis Raris with Jucundum Apiara, sticky pearls, and honeydew to train them to mop his floor, but regretted it when the bees waxed the floor instead.",
    desc = "Enchanted bees are almost supernaturally friendly, often leaving little 'gifts' of beeswax and honey near humans.",
    lifespan = { "Short" },
    productivity = {"Normal"},
    fertility = { "Unlucky", "Fertile" },
    stability = {"Unstable"},
    behaviour = {"Diurnal"},
    climate = {"Temperate"},
    rainlover = false,
    snowlover = false,
    grumpy = false,
    produce = "magic_bees_magical_wax",
    recipes = {},
    calming = {},
    chance = 100,
    bid = "mE",
    requirement = ""
  }
  
  api_define_bee(enchanted_bee, 
    "sprites/enchanted_bee_item.png", "sprites/enchanted_bee_shiny.png", 
    "sprites/enchanted_bee_hd.png",
    {r=66, g=132, b=255},
    "sprites/enchanted_bee_mag.png",
    "Up and coming beekeeper " .. api_get_property(api_get_player_instance(), "name") .. " has introduced Enchanted Bees to the archipelago!",
    "'I don't know who keeps refilling my apicola keg, but I'm not going to argue.' said one local sea captain."
  )
  
  shadow_bee = {
    id = "shadow",
    title = "Shadow",
    latin = "Apis Umbra",
    hint = "It would take a bright light to find these bees moving about in the shadows during the night.",
    desc = "Almost completely blind, the Shadow Bee works only in darkest night, making unseen honey in pitch black hives.",
    lifespan = { "Short" },
    productivity = {"Normal"},
    fertility = { "Fertile", "Fecund" },
    stability = {"Stable"},
    behaviour = {"Nocturnal"},
    climate = {"Polar"},
    rainlover = false,
    snowlover = false,
    grumpy = true,
    produce = "magic_bees_shadow_oil",
    recipes = {},
    calming = {"flower7", "flower12"},
    chance = 100,
    bid = "mS",
    requirement = ""
  }
  
  api_define_bee(shadow_bee, 
    "sprites/shadow_bee_item.png", "sprites/shadow_bee_shiny.png", 
    "sprites/shadow_bee_hd.png",
    {r=59, g=0, b=255},
    "sprites/shadow_bee_mag.png",
    "Bright-eyed beekeeper " .. api_get_property(api_get_player_instance(), "name") .. " has restored the Shadow Bee!",
    "Residents have reported being afraid to go out after dark."
  )
  
  -- elden_bee = {
    -- id = "elden",
    -- title = "Elden",
    -- latin = "Apis Aureus",
    -- hint = "Bonking this bee over the head hard enough should probably do the trick.",
    -- desc = "An ancient bee that really loves trees and gets angry when they catch on fire.",
    -- lifespan = {"Eternal" },
    -- productivity = {"Slow"},
    -- fertility = {"Infertile"},
    -- stability = {"Pure"},
    -- behaviour = {"Nocturnal"},
    -- climate = {"Temperate"},
    -- rainlover = false,
    -- snowlover = false,
    -- grumpy = true,
    -- produce = "magic_bees_rune_arc",
    -- recipes = {},
    -- calming = { "flower5", "flower12" },
    -- chance = 100,
    -- bid = "me",
    -- requirement = ""
  -- }
  
  -- api_define_bee(elden_bee, 
    -- "sprites/elden_bee_item.png", "sprites/elden_bee_shiny.png", 
    -- "sprites/elden_bee_hd.png",
    -- {r=229, g=221, b=0},
    -- "sprites/elden_bee_mag.png",
    -- "The Elden bee's population numbers are no longer tarnished thanks to the graceful apiarist, " .. api_get_property(api_get_player_instance(), "name") .. "!",
    -- "'I bet they summoned help.' - Beenjamin."
  -- )
  
  -- Turns out if you try to define a custom trait for bee species you haven't defined yet, they break!
  api_define_trait("magic", {
    twilight = {"spoken"},
    sacred = {"scream"},
    lightning = {"tempest"},
    hallowed = {"shout"},
    fair = {"whisper"},
    enchanted = {"whisper"},
    shadow = {"murmur"}
  }, {"silence"}) -- default for all the other bees
  -- Silence, Whisper, Murmur, Spoken, Shout, Scream, Tempest... Anechoic
end


-- define the mutation critera/chance for our new bee
--function mutation_chance()
  -- rocky-dream 30% chance at night to mutate
  --if (bee_a == "rocky" and bee_b == "dream") or (bee_a == "dream" and bee_b == "rocky") then
    --time = api_get_time()
    --chance = api_random(99) + 1
    --if time["name"] == "Night" and chance <= 30 then
      --return true
    --end
  --end
  --return false;
--end


-- define a new npc
function define_npc()

  --set npc definition
  wiz_def = {
    id = 701,
    name = "Buzzriel",
    pronouns = "He/They",
    tooltip = "BEEHOLD!",
    shop = true,
    walking = true,
    stock = {"magic_bees_magic_circle", "magic_bees_fairy_dust", "magic_bees_toadstool", "magic_bees_magical_wax", "log", "log", "log", "log", "log", "log"}, -- max 10
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
function define_book()
  -- define a new item
  -- this will give us a way to open our book when we want to
  api_define_item({
    id = "my_book_item",
    name = "My Book",
    category = "Books",
    tooltip = "Right-click to open!",
    shop_key = true,
    shop_buy = 0,
    shop_sell = 0,
    singular = true
  }, "sprites/book_item.png")
  -- define new menu object
  -- this will act as our books "menu"
  api_define_menu_object({
    id = "my_book",
    name = "My Book",
    category = "Books",
    tooltip = "This is my cool book",
    shop_key = false,
    shop_buy = 0,
    shop_sell = 0,
    center = true,
    invisible = true,
    layout = {},
    buttons = {"Close"},
    info = {},
    tools = {"mouse1", "hammer1"},
    placeable = true
  }, "sprites/book_item.png", "sprites/book_menu.png", {
    define = "book_define", -- defined below as a function
    draw = "book_draw" -- defined below as a function
  })
  -- finally, this will add our book to the library bar on the bottom
  api_library_add_book("my_sweet_book", "book_open", "sprites/book_button.png")
end


-- function called when clicking the library book button
function book_open()
  api_toggle_menu(MY_BOOK_MENU, true)
end


-- define the book
function book_define(menu_id) 
  -- set the menu object to immortal so it's never deactivated
  obj_id = api_get_menus_obj(menu_id)
  immortal = api_set_immortal(obj_id, true)
  -- set to global for later
  MY_BOOK_MENU = menu_id
  MY_BOOK_OBJ = obj_id
end


-- draw our book, called in the gui() hook
function book_draw(menu_id)

  -- draw something on top!
  menu = api_get_inst(menu_id)
  cam = api_get_cam()
  mx = menu["x"] - cam["x"]
  my = menu["y"] - cam["y"]

  -- draw the menu
  api_draw_sprite(menu["sprite_index"], 0, mx, my)

  -- draw some text
  api_draw_text(mx + 6, my + 4, "Hello World!", false, "FONT_BOOK")

end