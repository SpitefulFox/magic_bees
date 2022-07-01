function define_bees()
  -- setup bee_definition 
  local fair_bee = {
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
    requirement = "",
    tier = 2
  }
  
  api_define_bee(fair_bee, 
    "sprites/bees/fair_bee_item.png", "sprites/bees/fair_bee_shiny.png", 
    "sprites/bees/fair_bee_hd.png",
    {r=255, g=142, b=236},
    "sprites/bees/fair_bee_mag.png",
    "Flying straight out of a fairy tale, the Fair Bees have been repopulated by the apiarist that may be called " .. api_get_property(api_get_player_instance(), "name") .. "!",
    "Archipelago residents have taken to leaving bowls of sugar water on their doorsteps as offerings."
  )
  
  local enchanted_bee = {
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
    requirement = "",
    tier = 2
  }
  
  api_define_bee(enchanted_bee, 
    "sprites/bees/enchanted_bee_item.png", "sprites/bees/enchanted_bee_shiny.png", 
    "sprites/bees/enchanted_bee_hd.png",
    {r=66, g=132, b=255},
    "sprites/bees/enchanted_bee_mag.png",
    "Up and coming beekeeper " .. api_get_property(api_get_player_instance(), "name") .. " has introduced Enchanted Bees to the archipelago!",
    "'I don't know who keeps refilling my apicola keg, but I'm not going to argue.' said one local sea captain."
  )
  
  local shadow_bee = {
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
    requirement = "",
    tier = 3
  }
  
  api_define_bee(shadow_bee, 
    "sprites/bees/shadow_bee_item.png", "sprites/bees/shadow_bee_shiny.png", 
    "sprites/bees/shadow_bee_hd.png",
    {r=59, g=0, b=255},
    "sprites/bees/shadow_bee_mag.png",
    "Bright-eyed beekeeper " .. api_get_property(api_get_player_instance(), "name") .. " has restored the Shadow Bee!",
    "Residents have reported being afraid to go out after dark."
  )
  
  local runic_bee = {
    id = "runic",
    title = "Runic",
    latin = "Apis Signum",
    hint = "Apis Petra and Apis Incantatus show great interest in nearby ritual circles. Perhaps a circle of runed walls might inspire them.",
    desc = "The Runic Bee carves strange patterns into nearby surfaces as well as their own hives. Some fringe theorists say analyzing enough of the patterns will uncover a greater mystery, but the Apicademy dismisses such ramblings.",
    lifespan = { "Short", "Normal" },
    productivity = {"Normal", "Fast"},
    fertility = { "Unlucky", "Fertile" },
    stability = {"Erratic", "Unstable", "Normal"},
    behaviour = {"Nocturnal"},
    climate = {"Temperate"},
    rainlover = false,
    snowlover = false,
    grumpy = false,
    produce = "magic_bees_rune_shard",
    recipes = {},
    chance = 24,
    bid = "mR",
    requirement = "While near a ritual circle with four runed walls",
    tier = 3
  }
  
  api_define_bee(runic_bee, 
    "sprites/bees/runic_bee_item.png", "sprites/bees/runic_bee_shiny.png", 
    "sprites/bees/runic_bee_hd.png",
    {r=224, g=209, b=0},
    "sprites/bees/runic_bee_mag.png",
    "Thanks to " .. api_get_property(api_get_player_instance(), "name") .. "'s efforts, the Runic Bee has been restored!",
    "Bee-carved dice have become the latest craze in the local tabletop gaming scene."
  )
  
  api_define_bee_recipe("enchanted", "rocky", "runic", "runic_bee_recipe")
  
  local void_bee = {
    id = "void",
    title = "Void",
    latin = "Apis Nihilus",
    hint = "Apis Umbra and Apis Incantatus would need their magical ability bred out of them to rediscover this bee.",
    desc = "The Void Bee tends to its hive in absolute silence. Areas inhabited by Void bees almost seem calmer, as if nothing wants to disturb them.",
    lifespan = { "Long" },
    productivity = { "Normal" },
    fertility = { "Infertile" },
    stability = {"Ordered", "Pure"},
    behaviour = {"Nocturnal"},
    climate = {"Polar"},
    rainlover = false,
    snowlover = false,
    grumpy = false,
    produce = "magic_bees_void_wax",
    recipes = {},
    chance = 16,
    bid = "mV",
    requirement = "When queen has a magic trait of 1",
    tier = 4
  }
  
  api_define_bee(void_bee, 
    "sprites/bees/void_bee_item.png", "sprites/bees/void_bee_shiny.png", 
    "sprites/bees/void_bee_hd.png",
    {r=2, g=0, b=1},
    "sprites/bees/void_bee_mag.png",
    "Soft-spoken apiarist " .. api_get_property(api_get_player_instance(), "name") .. " has brought the Void Bee back from nothingness!",
    "'They're kind of nice, to be honest.' - Beenjamin BhD"
  )
  
  api_define_bee_recipe("enchanted", "shadow", "void", "void_bee_recipe")
  
  local wintry_bee = {
    id = "wintry",
    title = "Wintry",
    latin = "Apis Hibernus",
    hint = "A rare hybrid of Formosus and Frigidus said to appear on snowy nights.",
    desc = "The Wintry Bee holds court in glittering, frozen hives and is known for its spicy honey reminiscent of mulled apicola.",
    lifespan = { "Long" },
    productivity = { "Normal" },
    fertility = { "Unlucky", "Fertile" },
    stability = {"Stable", "Ordered"},
    behaviour = {"Nocturnal"},
    climate = {"Polar"},
    rainlover = false,
    snowlover = true,
    grumpy = false,
    produce = "magic_bees_winter_spice",
    recipes = {},
    chance = 20,
    bid = "mW",
    requirement = "At night during snowfall",
    tier = 4
  }
  
  api_define_bee(wintry_bee, 
    "sprites/bees/wintry_bee_item.png", "sprites/bees/wintry_bee_shiny.png", 
    "sprites/bees/wintry_bee_hd.png",
    {r=154, g=221, b=249},
    "sprites/bees/wintry_bee_mag.png",
    "Warm-hearted " .. api_get_property(api_get_player_instance(), "name") .. " has reintroduced the Wintry Bee to the wild!",
    "Local appreciator of Apicola, Skipper, was last seen preparing for a trip to the tundra."
  )
  
  api_define_bee_recipe("fair", "frosty", "wintry", "wintry_bee_recipe")
  
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
    -- "sprites/bees/elden_bee_item.png", "sprites/bees/elden_bee_shiny.png", 
    -- "sprites/bees/elden_bee_hd.png",
    -- {r=229, g=221, b=0},
    -- "sprites/bees/elden_bee_mag.png",
    -- "The Elden bee's population numbers are no longer tarnished thanks to the graceful apiarist, " .. api_get_property(api_get_player_instance(), "name") .. "!",
    -- "'I bet they summoned help.' - Beenjamin."
  -- )
  
  -- Turns out if you try to define a custom trait for bee species you haven't defined yet, they break!
  api_define_trait("magic", {
    twilight = {"Spoken"},
    sacred = {"Roaring"},
    lightning = {"Tempest"},
    hallowed = {"Shouting"},
    glitched = {"Anechoic", "Silent", "Whispered", "Murmured", "Spoken", "Shouting", "Roaring", "Tempest"},
    fair = {"Whispered"},
    enchanted = {"Whispered"},
    shadow = {"Murmured"},
    runic = {"Murmured", "Spoken"},
    void = {"Anechoic"},
    wintry = {"Spoken", "Shouting"}
  }, {"Silent"}) -- default for all the other bees
  -- Silent, Whispered, Murmured, Spoken, Shouting, Roaring, Tempest... Anechoic
end

function runic_bee_recipe(bee_a, bee_b, beehive)
  if (bee_a == "enchanted" and bee_b == "rocky") or (bee_a == "rocky" and bee_b == "enchanted") then
    --api_log("mutation", "Correct combination of bees")
    local bhive = api_get_inst(beehive)
    -- if bhive then
      -- api_log("mutation", "Successfully grabbed hive at " .. bhive["x"] .. ", " .. bhive["y"])
    -- end
    local circles = api_get_menu_objects(100, "magic_bees_magic_circle", bhive)
    if #circles > 0 then
      api_log("mutation", #circles .. " circles found!")
      for i=1,#circles do
        local slots = api_get_slots(circles[i]["menu_id"])
        local runes = 0
        for j=2,7 do
          if slots[j]["item"] == "wall701" then
            runes = runes + 1
          end
        end
        if runes >= 4 then
          return get_stable_chance(24, bhive["menu_id"])
        end
      end
    end
  end
  return false
end

function void_bee_recipe(bee_a, bee_b, beehive)
  if (bee_a == "enchanted" and bee_b == "shadow") or (bee_a == "shadow" and bee_b == "enchanted") then
    --api_log("mutation", "Correct combination of bees")
    local bhive = api_get_inst(beehive)
    -- if bhive then
      -- api_log("mutation", "Successfully grabbed hive at " .. bhive["x"] .. ", " .. bhive["y"])
    -- end
    local queen = api_get_slot(bhive["menu_id"], 1)
    if(queen["stats"]["d_traits"]["magic_bees_magic"] == "Silent" or queen["stats"]["d_traits"]["magic_bees_magic"] == "Anechoic") then
      return get_stable_chance(16, bhive["menu_id"])
    end
  end
  return false
end

function wintry_bee_recipe(bee_a, bee_b, beehive)
  if (bee_a == "fair" and bee_b == "frosty") or (bee_a == "frosty" and bee_b == "fair") then
    local bhive = api_get_inst(beehive)
    if api_get_ground(bhive["x"], bhive["y"]) == "grass3" then
      if api_get_weather()["active"] and api_get_time()["name"] == "Night" then
        return get_stable_chance(20, bhive["menu_id"])
      end
    end
  end
  return false
end

function get_stable_chance(base_chance, beehive)
  --api_log("mutation", "Beehive? " .. beehive)
  local slots = api_get_slots(beehive)
  -- if #slots < 1 then
    -- api_log("mutation", "No slots?!")
  -- end
  if slots[1]["item"] == "" then
    --api_log("mutation", "No bee in slot 1?!")
    return false
  end
  local stability = slots[1]["stats"]["d_traits"]["stability"]
  if stability then
    return (api_random(99) + 1 - stability_modifier(stability)) < base_chance
  end
  --api_log("mutation", "No stability?!")
  return false
end

function stability_modifier(stability)
  if stability == "Pure" then
    return -100
  elseif stability == "Ordered" then
    return -5
  elseif stability == "Normal" then
    return 5
  elseif stability == "Unstable" then
    return 8
  elseif stability == "Erratic" then
    return 12
  elseif stability == "Chaotic" then
    return 20
  end
  return 0
end