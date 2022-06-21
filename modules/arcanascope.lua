
function define_arcanascope()
  api_define_menu_object({
    id = "arcanascope",
    name = "Arcanascope",
    category = "Beekeeping",
    tooltip = "Used to identify magical bee traits",
    layout = {
      {7, 17, "Input", {"bee"}},
      {7, 116},
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
    shop_buy = 200,
    shop_sell = 140,
  }, "sprites/arcanascope_item.png", "sprites/arcanascope_menu.png",
  {
    define = "arcanascope_define",
    draw = "arcanascope_draw",
    change = "arcanascope_change"
  })
  
  STAT_NUMBERS = api_define_sprite("magic_bees_numbers", "sprites/arcanascope_gui_numbers.png", 8)
  SCOPE_SYMBOLS = api_define_sprite("magic_bees_arcanascope_symbols", "sprites/arcanascope_gui_symbols.png", 9)
end

function arcanascope_define(menu_id)
  api_define_gui(menu_id, "arcanascope_stats", 28, 14, "arcanascope_stat_tooltip", "sprites/arcanascope_gui_stats.png")
  api_dp(menu_id, "stats_sprite", api_get_sprite("magic_bees_arcanascope_stats"))
  api_define_gui(menu_id, "arcanascope_behaviors", 28, 80, "arcanascope_behavior_tooltip", "sprites/arcanascope_gui_behaviors.png")
  api_dp(menu_id, "behaviors_sprite", api_get_sprite("magic_bees_arcanascope_behaviors"))
  
  api_dp(menu_id, "has_bee", false)
  api_dp(menu_id, "bee_hd", 0)
  api_dp(menu_id, "specd", "C")
  api_dp(menu_id, "colord", "FONT_WHITE")
  api_dp(menu_id, "specr", "C")
  api_dp(menu_id, "colorr", "FONT_WHITE")
  api_dp(menu_id, "grump", false)
  api_dp(menu_id, "beetrice", false)
  api_dp(menu_id, "day", false)
  api_dp(menu_id, "night", false)
  api_dp(menu_id, "dusk", false)
  api_dp(menu_id, "rain", false)
  api_dp(menu_id, "snow", false)
  api_dp(menu_id, "cold", false)
  api_dp(menu_id, "hot", false)
  api_dp(menu_id, "life", 1)
  api_dp(menu_id, "lifer", 1)
  api_dp(menu_id, "prod", 1)
  api_dp(menu_id, "prodr", 1)
  api_dp(menu_id, "fert", 1)
  api_dp(menu_id, "fertr", 1)
  api_dp(menu_id, "stab", 1)
  api_dp(menu_id, "stabr", 1)
  api_dp(menu_id, "mag", 1)
  api_dp(menu_id, "magr", 1)
  
end

function arcanascope_draw(menu_id)
  local cam = api_get_cam()
  local ui = api_get_inst(menu_id)
  
  local stats = api_get_inst(api_get_property(menu_id, "arcanascope_stats"))
  local stats_spr = api_get_property(menu_id, "stats_sprite")
  local statx = stats["x"] - cam["x"]
  local staty = stats["y"] - cam["y"]
  
  local beh = api_get_inst(api_get_property(menu_id, "arcanascope_behaviors"))
  local beh_spr = api_get_property(menu_id, "behaviors_sprite")
  local behx = beh["x"] - cam["x"]
  local behy = beh["y"] - cam["y"]
  
  if api_get_property(menu_id, "has_bee") then
    draw_stat(menu_id, "life", statx, staty + 5, "FONT_GREEN")
    draw_stat(menu_id, "prod", statx, staty + 17, "FONT_YELLOW")
    draw_stat(menu_id, "fert", statx, staty + 29, "FONT_RED")
    draw_stat(menu_id, "stab", statx, staty + 41, "FONT_BLUE")
    draw_stat(menu_id, "mag", statx, staty + 53, "BEE_TWILIGHT")
    
    api_draw_sprite(api_get_property(menu_id, "bee_hd"), 0, ui["x"] - cam["x"] + 105, ui["y"] - cam["y"] + 30)
    api_draw_text(ui["x"] - cam["x"] + 99, ui["y"] - cam["y"] + 17, api_get_property(menu_id, "specd"), false, api_get_property(menu_id, "colord"))
    api_draw_text(ui["x"] - cam["x"] + 105, ui["y"] - cam["y"] + 17, api_get_property(menu_id, "specr"), false, api_get_property(menu_id, "colorr"))
    
    if api_get_property(menu_id, "grump") then
      api_draw_sprite(SCOPE_SYMBOLS, 7, ui["x"] - cam["x"] + 152, ui["y"]  - cam["y"] + 19)
    end
    if api_get_property(menu_id, "beetrice") then
      api_draw_sprite(SCOPE_SYMBOLS, 8, ui["x"] - cam["x"] + 152, ui["y"] - cam["y"] + 85)
    end
    
    if api_get_property(menu_id, "day") then
      api_draw_sprite(SCOPE_SYMBOLS, 0, behx + 17, behy + 5)
    end
    if api_get_property(menu_id, "night") then
      api_draw_sprite(SCOPE_SYMBOLS, 1, behx + 34, behy + 5)
    end
    if api_get_property(menu_id, "dusk") then
      api_draw_sprite(SCOPE_SYMBOLS, 2, behx + 51, behy + 5)
    end
    
    if api_get_property(menu_id, "rain") then
      api_draw_sprite(SCOPE_SYMBOLS, 3, behx + 17, behy + 17)
    end
    if api_get_property(menu_id, "snow") then
      api_draw_sprite(SCOPE_SYMBOLS, 6, behx + 17, behy + 17)
    end
    if api_get_property(menu_id, "cold") then
      api_draw_sprite(SCOPE_SYMBOLS, 4, behx + 34, behy + 17)
    end
    if api_get_property(menu_id, "hot") then
      api_draw_sprite(SCOPE_SYMBOLS, 5, behx + 51, behy + 17)
    end
  end
  
  local highl = api_get_highlighted("ui")
  if highl == stats["id"] then
    api_draw_sprite(stats_spr, 0, statx, staty)
  elseif highl == beh["id"] then
    api_draw_sprite(beh_spr, 0, behx, behy)
  end
  
end

function draw_stat(menu_id, trait, x, y, color)
  local stat = api_get_property(menu_id, trait)
  local statx = STAT_DRAWS[stat]
  api_draw_rectangle(x + statx, y, x + statx + 4, y + 6, color)
  api_draw_sprite(STAT_NUMBERS, stat, x + statx, y)
  local statr = api_get_property(menu_id, trait .. "r")
  if statr > 0 then
    local statxr = STAT_DRAWS[statr]
    api_draw_rectangle(x + statxr, y, x + statxr + 4, y, color)
    api_draw_rectangle(x + statxr, y + 2, x + statxr + 4, y + 2, color)
    api_draw_rectangle(x + statxr, y + 4, x + statxr + 4, y + 4, color)
    api_draw_rectangle(x + statxr, y + 6, x + statxr + 4, y + 6, color)
  end
end

function arcanascope_change(menu_id)
  local bee = api_get_slot(menu_id, 1)
  if bee["item"] ~= "" then
    api_set_property(menu_id, "has_bee", true)
    --api_log("arcanascope", bee["stats"]["d_traits"])
    
    local lifespan = translate_stat(bee["stats"]["d_traits"]["lifespan"], "lifespan")
    api_set_property(menu_id, "life", lifespan)
    local lifespanr = translate_stat(bee["stats"]["r_traits"]["lifespan"], "lifespan")
    if lifespan ~= lifespanr then
      api_set_property(menu_id, "lifer", lifespanr)
    else
      api_set_property(menu_id, "lifer", 0)
    end
    
    local productivity = translate_stat(bee["stats"]["d_traits"]["productivity"], "productivity")
    api_set_property(menu_id, "prod", productivity)
    local productivityr = translate_stat(bee["stats"]["r_traits"]["productivity"], "productivity")
    if productivity ~= productivityr then
      api_set_property(menu_id, "prodr", productivityr)
    else
      api_set_property(menu_id, "prodr", 0)
    end
    
    local fertility = translate_stat(bee["stats"]["d_traits"]["fertility"], "fertility")
    api_set_property(menu_id, "fert", fertility)
    local fertilityr = translate_stat(bee["stats"]["r_traits"]["fertility"], "fertility")
    if fertility ~= fertilityr then
      api_set_property(menu_id, "fertr", fertilityr)
    else
      api_set_property(menu_id, "fertr", 0)
    end
    
    local stability = translate_stat(bee["stats"]["d_traits"]["stability"], "stability")
    api_set_property(menu_id, "stab", stability)
    local stabilityr = translate_stat(bee["stats"]["r_traits"]["stability"], "stability")
    if stability ~= stabilityr then
      api_set_property(menu_id, "stabr", stabilityr)
    else
      api_set_property(menu_id, "stabr", 0)
    end
    
    local magic = translate_stat(bee["stats"]["d_traits"]["magic_bees_magic"], "magic")
    api_set_property(menu_id, "mag", magic)
    local magicr = translate_stat(bee["stats"]["r_traits"]["magic_bees_magic"], "magic")
    if magic ~= magicr then
      api_set_property(menu_id, "magr", magicr)
    else
      api_set_property(menu_id, "magr", 0)
    end
    
    local species = bee["stats"]["species"]
    local speciesr = bee["stats"]["r_traits"]["species"]
    
    api_set_property(menu_id, "bee_hd", api_get_sprite("sp_bee_" .. species .. "_hd"))
    api_set_property(menu_id, "specd", string.upper(string.sub(species, 1, 1)))
    api_set_property(menu_id, "specr", string.upper(string.sub(speciesr, 1, 1)))
    api_set_property(menu_id, "colord", "BEE_" .. string.upper(species))
    api_set_property(menu_id, "colorr", "BEE_" .. string.upper(speciesr))
    
    api_set_property(menu_id, "beetrice", bee["stats"]["beetrice"] == 1)
    api_set_property(menu_id, "grump", bee["stats"]["d_traits"]["aggressive"] == 1)
    --api_log("grumpus", api_get_property(menu_id, "grump"))
    
    api_set_property(menu_id, "rain", bee["stats"]["d_traits"]["pluviophile"] == 1)
    api_set_property(menu_id, "snow", bee["stats"]["d_traits"]["chionophile"] == 1)
  
    if bee["stats"]["d_traits"]["behaviour"] == "Diurnal" then
      api_set_property(menu_id, "day", true)
      api_set_property(menu_id, "night", false)
      api_set_property(menu_id, "dusk", false)
    elseif bee["stats"]["d_traits"]["behaviour"] == "Nocturnal" then
      api_set_property(menu_id, "day", false)
      api_set_property(menu_id, "night", true)
      api_set_property(menu_id, "dusk", false)
    elseif bee["stats"]["d_traits"]["behaviour"] == "Crepuscular" then
      api_set_property(menu_id, "day", false)
      api_set_property(menu_id, "night", false)
      api_set_property(menu_id, "dusk", true)
    else
      api_set_property(menu_id, "day", true)
      api_set_property(menu_id, "night", true)
      api_set_property(menu_id, "dusk", true)
    end
    
    if bee["stats"]["d_traits"]["climate"] == "Temperate" then
      api_set_property(menu_id, "cold", false)
      api_set_property(menu_id, "hot", false)
    elseif bee["stats"]["d_traits"]["climate"] == "Polar" then
      api_set_property(menu_id, "cold", true)
      api_set_property(menu_id, "hot", false)
    elseif bee["stats"]["d_traits"]["climate"] == "Tropic" then
      api_set_property(menu_id, "cold", false)
      api_set_property(menu_id, "hot", true)
    else
      api_set_property(menu_id, "cold", true)
      api_set_property(menu_id, "hot", true)
    end
  else
    api_set_property(menu_id, "has_bee", false)
  end  
end

function arcanascope_stat_tooltip(menu_id)
  if api_get_property(menu_id, "has_bee") then
    local bee = api_get_slot(menu_id, 1)
    return {
      {"Lifespan: " .. bee["stats"]["d_traits"]["lifespan"] .. "/" .. bee["stats"]["r_traits"]["lifespan"], "FONT_GREEN"},
      {"Productivity: " .. bee["stats"]["d_traits"]["productivity"] .. "/" .. bee["stats"]["r_traits"]["productivity"], "FONT_YELLOW"},
      {"Fertility: " .. bee["stats"]["d_traits"]["fertility"] .. "/" .. bee["stats"]["r_traits"]["fertility"], "FONT_RED"},
      {"Stability: " .. bee["stats"]["d_traits"]["stability"] .. "/" .. bee["stats"]["r_traits"]["stability"], "FONT_BLUE"},
      {"Magic: " .. bee["stats"]["d_traits"]["magic_bees_magic"] .. "/" .. bee["stats"]["r_traits"]["magic_bees_magic"], "BEE_TWILIGHT"}
    }
  end
end

function arcanascope_behavior_tooltip(menu_id)
  if api_get_property(menu_id, "has_bee") then
    local bee = api_get_slot(menu_id, 1)
    return {
      {"Behaviour: " .. bee["stats"]["d_traits"]["behaviour"] .. "/" .. bee["stats"]["r_traits"]["behaviour"], "FONT_WHITE"},
      {"Climate: " .. bee["stats"]["d_traits"]["climate"] .. "/" .. bee["stats"]["r_traits"]["climate"], "FONT_WHITE"}
    }
  end
end

STATS_TABLE = {
  lifespan = {
    Hyper = 1,
    Rapid = 2,
    Short = 3,
    Normal = 4,
    Long = 5,
    Ancient = 6,
    Eternal = 7
  },
  productivity = {
    Sluggish = 1,
    Slowest = 2,
    Slow = 3,
    Normal = 4,
    Fast = 5,
    Fastest = 6,
    Brisk = 7
  },
  fertility = {
    Sterile = 1,
    Infertile = 2,
    Unlucky = 3,
    Fertile = 4,
    Fecund = 5,
    Prolific = 6,
    Swarming = 7
  },
  stability = {
    Chaotic = 1,
    Erratic = 2,
    Unstable = 3,
    Normal = 4,
    Stable = 5,
    Ordered = 6,
    Pure = 7
  },
   magic = {
        Anechoic = -1,
    Silent = 1,
  Whispered = 2,
        Murmured = 3,
      Spoken = 4,
 Shouting = 5,
         Roaring = 6,
   Tempest = 7
  }
}

STAT_DRAWS = {
  14,
  21,
  28,
  35,
  42,
  49,
  56
}

STAT_NUMBERS = nil

SCOPE_SYMBOLS = nil

function translate_stat(stat, stat_type)
  if STATS_TABLE[stat_type][stat] ~= nil then
    return STATS_TABLE[stat_type][stat]
  else
    return 1
  end
end