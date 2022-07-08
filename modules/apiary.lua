

function define_arcanascope()
  api_define_menu_object({
    id = "arcane_apiary",
    name = "Arcane Apiary",
    category = "Beekeeping",
    tooltip = "Used to breed bees, collect quintessence, and fill Frames.",
    layout = {
      {7, 17, "Input", {"bee"}},
      {7, 43, "Input", {"bee", "royaljelly", "randomjelly"}},
      {30, 116},
      {53, 116},
      {76, 116},
      {99, 116},
      {122, 116},
      {145, 116},
      {7, 139},
      {30, 139},
      {53, 139},
      {76, 139},
      {99, 139},
      {122, 139},
      {145, 139}
    },
    buttons = {"Help", "Target", "Move", "Close"},
    info = {
      {"1. Bee Input", "GREEN"},
      {"2. Extra Storage", "WHITE"}
    },
    tools = {"mouse1", "hammer1"},
    placeable = true,
  }, "sprites/arcane_apiary_item.png", "sprites/arcane_apiary_menu.png",
  {
    define = "arcane_apiary_define",
    draw = "arcane_apiary_draw",
    change = "arcane_apiary_change"
  })
  
end

function arcane_apiary_define(menu_id)
  
  
end

function arcane_apiary_draw(menu_id)
  local cam = api_get_cam()
  local ui = api_get_inst(menu_id)
  
  
  
end

function arcane_apiary_change(menu_id)
  
end