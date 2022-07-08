

function define_quintessence()
  api_define_color("OCTIRENE", {r=176,g=81,b=255})
  
  api_define_liquid(
    "Quintessence", 
    "OCTIRENE", 
    "sprites/quintessence_texture.png",
    "sprites/quintessence_preview.png" 
  )
  
  api_define_command('/magic', "make_magic")
  
  api_define_menu_object({
    id = "essence_node",
    name = "Quintessence Node",
    category = "Arcane",
    tooltip = "Collects quintessence from nearby active apiaries based on the bees' magic trait.",
    layout = {
      {7, 63, "Liquid Input", {"canisterX"}},
      {30, 63, "Liquid Output", {"canisterX"}}
    },
    buttons = {"Help", "Target", "Move", "Close"},
    info = {
      {"1. Liquid Input Slot", "GREEN"},
      {"2. Liquid Drainage Slot", "RED"},
      {"3. Liquid Storage Tank", "YELLOW"}
    },
    tools = {"mouse1", "hammer1"},
    placeable = true,
    item_sprite = "sprites/essence_node_item.png",
    depth = 10
  }, "sprites/essence_node.png", "sprites/essence_node_menu.png",
  {
    define = "essence_node_define",
    draw = "essence_node_draw",
    change = "essence_node_change",
    tick = "essence_node_tick"
  })
  
end

function essence_node_define(menu_id)
  
  api_define_tank(menu_id, 0, 2000, "Quintessence", 7, 14, "medium")
  
  api_dp(menu_id, "p_start", 0)
  api_dp(menu_id, "p_end", 120)
  api_dp(menu_id, "amount", 5)
  
  -- save the special tank props to our menu._fields so the values are saved/loaded
  local fields = {"tank_amount", "tank_max", "tank_type"}
  fields = api_sp(menu_id, "_fields", fields)
  
  
end

function essence_node_draw(menu_id)
  --local cam = api_get_cam()
  --local ui = api_get_inst(menu_id)
  
  api_draw_tank(api_gp(menu_id, "tank_gui"))
  
end

function essence_node_change(menu_id)
  local slot = api_get_slot(menu_id, 2)
  if slot["item"] ~= ""  then
    api_slot_drain(menu_id, 2)
  end
  local slot = api_get_slot(menu_id, 1)
  
  if slot["item"] ~= ""  then
    api_slot_fill(menu_id, 1)
  end
end

function essence_node_tick(menu_id)
  local tick = api_get_property(menu_id, "p_start")
end

function make_magic(args)
  player_pos = api_get_player_position()
  canister = api_create_item("canister1", 0, player_pos["x"] + 32, player_pos["y"] + 32)
  stats = api_gp(canister, "stats")
  stats["type"] = "Quintessence"
  stats["amount"] = 400
  api_sp(canister, "stats", stats)
end