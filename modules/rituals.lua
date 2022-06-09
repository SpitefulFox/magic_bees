ritual_recipes = {
  {
    core = "bee:uncommon",
    reagents = {"flower3", "stickypearl", "honeydew"},
    result = "bee:enchanted"
  },
  {
    core = "mead",
    reagents = {"magic_bees_fairy_dust"},
    result = "magic_bees_fairy_cola"
  }
}

function define_rituals()
  api_define_menu_object({
    id = "magic_circle",
    name = "Ritual Circle",
    category = "Rituals",
    tooltip = "A kit for doing magical rituals.|Place some items in the circle and then right click to attempt a ritual",
    layout = {
      {62, 39},
      {42, 17},
      {82, 17},
      {30, 39},
      {94, 39},
      {42, 61},
      {82, 61},
      {7, 88},
      {29, 88},
      {51, 88},
      {73, 88},
      {95, 88},
      {117, 88}
    },
    buttons = {"Help", "Target", "Move", "Close"},
    info = {
      {"1. Core Item", "GREEN"},
      {"2. Reagents", "RED"},
      {"3. Extra Storage", "WHITE"},
    },
    tools = {"mouse1", "hammer1"},
    placeable = true,
    has_lighting = true,
    item_sprite = "sprites/ritual_chalk.png",
    shop_buy = 100,
    shop_sell = 70,
  }, "sprites/magic_circle.png", "sprites/ritual_menu.png", {}, "draw_ritual")
end

function draw_ritual(obj_id)
  obj_inst = api_get_inst(obj_id)
  spr_table = api_get_sprite("magic_bees_magic_circle")

  if api_get_highlighted("obj") == obj_id then
      api_draw_sprite(spr_table, 1, obj_inst["x"], obj_inst["y"])
  else
      api_draw_sprite(spr_table, 0, obj_inst["x"], obj_inst["y"])
  end
  local slots = api_get_slots(obj_inst["menu_id"])
  if slots[2]["item"] ~= "" then
    draw_ritual_slot(slots[2], obj_inst["x"], obj_inst["y"])
  end
  if slots[3]["item"] ~= "" then
    draw_ritual_slot(slots[3], obj_inst["x"] + 16, obj_inst["y"])
  end
  if slots[4]["item"] ~= "" then
    draw_ritual_slot(slots[4], obj_inst["x"] - 8, obj_inst["y"] + 8)
  end
  if slots[5]["item"] ~= "" then
    draw_ritual_slot(slots[5], obj_inst["x"] + 24, obj_inst["y"] + 8)
  end
  if slots[1]["item"] ~= "" then
    draw_ritual_slot(slots[1], obj_inst["x"] + 8, obj_inst["y"] + 8)
  end
  if slots[6]["item"] ~= "" then
    draw_ritual_slot(slots[6], obj_inst["x"], obj_inst["y"] + 16)
  end
  if slots[7]["item"] ~= "" then
    draw_ritual_slot(slots[7], obj_inst["x"] + 16, obj_inst["y"] + 16)
  end
end

--Have to have special cases for bees because BEEEEES
function draw_ritual_slot(slot, x, y)
  if slot["item"] == "bee" then
    local species = slot["stats"]["d_traits"]["species"]
    if api_check_discovery("bee:" .. species) then
      api_draw_sprite(api_get_sprite("sp_bee_" .. species), 0, x - 1, y - 1)
    else
      api_draw_sprite(api_get_sprite("sp_bee_" .. species), 3, x - 1, y - 1)
    end
  else
    api_draw_sprite(api_get_sprite("sp_" .. slot["item"]), 0, x, y)
  end
end

--Check if a ritual can be done using the ingredients in the slots by comparing to the recipe list
function check_ritual(slots)
  if slots[1]["item"] == "" then
    return {result = "", amount = -1}
  end
  for i = 1,#ritual_recipes do
    if item_match(ritual_recipes[i]["core"], slots[1]) then
      local output = slots[1]["count"]
      --Why do non-stacking items return 0???? >_<
      if output == 0 then
        output = 1
      end
      for j = 1,#ritual_recipes[i]["reagents"] do
        local valid = false
        for k = 2,7 do
          if slots[k]["item"] ~= "" and item_match(ritual_recipes[i]["reagents"][j], slots[k]) then
            if slots[k]["count"] > 0 and slots[k]["count"] < output then
              output = slots[k]["count"]
            end
            valid = true
            break
          end
        end
        if not valid then
          return {result = ritual_recipes[i]["result"], amount = 0}
        end
      end
      return {result = ritual_recipes[i]["result"], amount = output}
    -- else
      -- api_log("ritual", "Core not a match")
    end
  end
  return {result = "", amount = -1}
end

--Special cases for beeeeeeeeeeees
function item_match(itemA, itemB)
  if string.sub(itemA, 1, 4) == "bee:" then
    local species = string.sub(itemA, 5, #itemA)
    --api_log("match", "Checking for " .. species)
    if itemB["item"] == "bee" then
      return species == itemB["stats"]["d_traits"]["species"]
    else
      return false
    end
  else
    --api_log("match", "Comparing " .. itemA .." to " .. itemB["item"])
    return itemA == itemB["item"]
  end
end

function complete_ritual(result, amount, slots)
  if string.sub(result, 1, 4) == "bee:" then
    local species = string.sub(result, 5, #result)
    api_slot_set(slots[1]["id"], "bee", 1, api_create_bee_stats(species, false))
    for i = 2,7 do
      api_slot_decr(slots[i]["id"])
    end
  else
    api_slot_set(slots[1]["id"], result, amount)
    for i = 2,7 do
      api_slot_decr(slots[i]["id"], amount)
    end
  end
end