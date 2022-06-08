MOD_NAME = "magic_bees"

-- store a ref to our book menu for later
--MY_BOOK_MENU = nil
--MY_BOOK_OBJ = nil

CHANGELING_TICK = 0

function register()
  return {
    name = MOD_NAME,
    hooks = {"ready", "init", "click", "clock", "worldgen"},
    modules = {"utility", "rituals"}
  }
end

-- init is called once registered and gives you a chance to run any setup code
-- https://wiki.apico.buzz/wiki/Modding_API#init()
function init() 
  api_set_devmode(true)

  define_items()
  define_bees()
  define_rituals()
  --define_book()
  define_npc()
  return "Success"
end


-- ready is called once all mods are ready and once the world has loaded any undefined instances from mods in the save
-- https://wiki.apico.buzz/wiki/Modding_API#ready()
function ready()

  -- we're going to get the mod "data" file to see if this is the first time the mod has loaded
  --api_get_data()

  -- if we don't have a book obj create one
  -- once we create one and the player saves the game, next time we won't need/want to make a new one
  --existing = api_get_menu_objects(nil, "sample_mod_my_book")
  --if #existing == 0 then
    --api_create_obj("sample_mod_my_book", -32, -32)
  --end

  -- if we haven't given the player a book give them one
  -- once the player picks up the item it'll be marked in their discovery they got one
  --discovery = api_check_discovery("sample_mod_my_book_item")
  --if discovery == false then
    --api_give_item("sample_mod_my_book_item", 1)
  --end

  -- if we haven't already spawned our new npc, spawn them
  local wizard = api_get_menu_objects(nil, "npc701")
  if #wizard == 0 then
    playerer = api_get_player_position()
    api_create_obj("npc701", playerer["x"] + 16, playerer["y"] - 8)
  end

  -- play a sound to celebrate our mod loading! :D
  --api_play_sound("confetti")

end

function click(button, click_type)
  --api_log("click", "clickity clackity!")
  if click_type == "PRESSED" and button == "LEFT" then
    local highlighted_int = api_get_highlighted("obj")
    if highlighted_int ~= nil then
      local highlighted_obj = api_get_inst(highlighted_int)
      if highlighted_obj["oid"] == "magic_bees_toadstool" then
        api_create_item("magic_bees_toadstool", 1, highlighted_obj["x"], highlighted_obj["y"])
        api_destroy_inst(highlighted_obj["id"])
      end
      --api_log("ping", "X " .. highlighted_obj["x"] .. " Y " .. highlighted_obj["y"])
      --if highlighted_obj["oid"] == "hive3" then
        -- api_log("hive", "Found one. " .. highlighted_obj["menu_id"])-- .. tostring(#highlighted_obj["slots"]) .. " slots")
        -- local slots = api_get_slots(highlighted_obj["menu_id"])
        -- api_log("hive", "That's a hive.")
        -- api_log("hive", "There are " .. #slots .. " slots")
        -- for i = 1, #slots do
          -- api_log("hive", "Lets look at slot " .. i)
          -- if slots[i] then
            -- if slots[i]["item"] == "bee" then
              -- api_log("hive", slots[i]["stats"])
            --end
          --end
        --end
      --end
    end
  end
  if click_type == "RELEASED" and button == "RIGHT" then
    local highlighted_int = api_get_highlighted("obj")
    if highlighted_int ~= nil then
      local highlighted_obj = api_get_inst(highlighted_int)
      if highlighted_obj["oid"] == "magic_bees_magic_circle" then
        local ritual_slots = api_get_slots(highlighted_obj["menu_id"])
        local ritual_check = check_ritual(ritual_slots)
        --api_log("ritual", ritual_check)
        if ritual_check["amount"] > 0 then
          complete_ritual(ritual_check["result"], ritual_check["amount"], ritual_slots)
          api_play_sound("confetti")
          api_create_effect(highlighted_obj["x"] + 16, highlighted_obj["y"] + 16, "BEE_CONFETTI", 50, BEE_CHAOTIC)
          --api_create_effect(highlighted_obj["x"] + 16, highlighted_obj["y"] + 16, "BEE_PFX", 50, FONT_WHITE)
          --api_create_effect(highlighted_obj["x"] + 16, highlighted_obj["y"], "GATE_GROWTH", 1, BEE_CHAOTIC)
        end
      end
    end
  end
end

function clock()
  CHANGELING_TICK = CHANGELING_TICK + 1
  if CHANGELING_TICK >= 30 then
    CHANGELING_TICK = 0
    local hoives = api_get_menu_objects(nil, "hive1")
    if #hoives > 0 then
      for i=1, #hoives do
         if hoives[i] then
           local mushrooms = api_get_objects(20, "magic_bees_toadstool", hoives[i])
           if #mushrooms >= 4 then
             local slots = api_get_slots(hoives[i]["menu_id"])
             if slots[7] and slots[7]["item"] == "bee" and slots[7]["stats"] then
               local bee = slots[7]["stats"]
               if bee["d_traits"]["species"] == "common" and bee["r_traits"]["species"] == "common" then
                 api_slot_set(slots[7]["id"], "bee", 1, api_create_bee_stats("fair", false))
               end
             end
           end
         end
      end
    end
    hoives = api_get_menu_objects(nil, "hive2")
    if #hoives > 0 then
      for i=1, #hoives do
         if hoives[i] then
           local mushrooms = api_get_objects(20, "magic_bees_toadstool", hoives[i])
           if #mushrooms >= 4 then
             local slots = api_get_slots(hoives[i]["menu_id"])
             if slots[10] and slots[10]["item"] == "bee" and slots[10]["stats"] then
               local bee = slots[10]["stats"]
               if bee["d_traits"]["species"] == "common" and bee["r_traits"]["species"] == "common" then
                 api_slot_set(slots[10]["id"], "bee", 1, api_create_bee_stats("fair", false))
               end
             end
           end
         end
      end
    end
    hoives = api_get_menu_objects(nil, "hive3")
    if #hoives > 0 then
      for i=1, #hoives do
         if hoives[i] then
           local mushrooms = api_get_objects(20, "magic_bees_toadstool", hoives[i])
           if #mushrooms >= 4 then
             local slots = api_get_slots(hoives[i]["menu_id"])
             if slots[3] and slots[3]["item"] == "bee" and slots[3]["stats"] then
               local bee = slots[3]["stats"]
               if bee["d_traits"]["species"] == "common" and bee["r_traits"]["species"] == "common" then
                 api_slot_set(slots[3]["id"], "bee", 1, api_create_bee_stats("fair", false))
               end
             end
           end
         end
      end
    end
  end
end

function worldgen()
  for ex = 1408 - 16, 1408 + 32, 16 do
    for wy = 960 - 16, 960 + 32, 16 do
      if api_get_ground(ex, wy) ~= "grass1" then
        api_set_ground("grass1", ex, wy)
      end
    end
  end
  api_create_obj("npc701", 1408, 960)
  
  local shrooms = 0
  for i = 1, 75 do
    local ex = api_random_range(1273, 2811)
    local wy = api_random_range(292, 976)
    ex = ex - (ex % 16)
    wy = wy - (wy % 16)
    if api_get_ground(ex, wy) == "grass1" then
      api_create_obj("magic_bees_toadstool", ex, wy)
      shrooms = shrooms + 1
      if shrooms >= 25 then
        i = 75
      end
    end
  end
  
end

-- data is called any time we run api_get_data() or api_set_data()
-- https://wiki.apico.buzz/wiki/Modding_API#data()
function data(ev, data)
  
  -- for data load, data is nil if we have no data.json file existing
  -- you can have one in your mod root by default, or just make one 
  -- when you call api_set_data()
  if (ev == "LOAD" and data ~= nil) then
    -- worlds dont have unique identifiers so we can check with the player name
    name = api_gp(api_get_player_instance(), "name")
    if data["players"][name] == nil then
      -- this is the first time we have loaded this mod for this player
      -- we can use this to do something, i.e. spawn an object
      api_log("data", "First time!")
      -- once done we set the data value and update the data for next time
      data["players"][name] = true
      api_set_data(data)
    else
      -- this isn't our first rodeo!!
      api_log("data", "Loaded before.")
    end
  end

  -- check save was successful
  if (ev == "SAVE" and data ~= nil) then
    -- save was successful!
  end

end


-- gui is called each draw cycle. anything drawn in this hook will 
-- https://wiki.apico.buzz/wiki/Modding_API#click()
--function gui()

  -- draw book if open
  --if api_gp(MY_BOOK_OBJ, "open") == true then
    -- get screen pos
    --game = api_get_game_size()
    --cam = api_get_cam()
    -- draw black rectangle at 0.9 alpha over entire screen
    --api_draw_rectangle(0, 0, game["width"], game["height"], "BLACK", false, 0.9)
    -- redraw menu on gui layer
    --book_draw(MY_BOOK_MENU)
  --end

--end


-- click is called whenever the player clicks
-- https://wiki.apico.buzz/wiki/Modding_API#click()
--function click(button, click_type)
  
  -- check if we right click out book item to open the book
  --if button == "RIGHT" and click_type == "PRESSED" then

    -- fake opening a book by opening our fake menu object when the book is right clicked in a slot
    --highlighted = api_get_highlighted("slot")
    --if highlighted ~= nil then
      --slot = api_get_slot_inst(highlighted)
      --if slot["item"] == "sample_mod_my_book_item" then
        --api_toggle_menu(MY_BOOK_MENU, true)
      --end
    --end
  --end
  
--end
