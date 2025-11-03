SMODS.Atlas({
	key = "jokers",
	path = "jokers_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "vouchers",
	path = "vouchers_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "decks",
	path = "decks_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "editions",
	path = "editions_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "boosters",
	path = "boosters_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "tags",
	path = "tags_atlas.png",
	px = 34,
	py = 34,
})

SMODS.Atlas({
	key = "blinds",
	path = "bossblinds_atlas.png",
	px = 34,
	py = 34,
	atlas_table = "ANIMATION_ATLAS",
	frames = 21,
})

SMODS.Atlas({
	key = "modicon",
	path = "modicon.png",
	px = 32,
	py = 32,
})

-- this one is just for my fucken animated stuff

SMODS.Atlas({
	key = "selfinsert",
	path = "selfinsert_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "mcparkour",
	path = "mcparkour_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "flynn",
	path = "flynn_atlas.png",
	px = 71,
	py = 95,
})

-- the 2 wide joker

SMODS.Atlas({
	key = "2widejoker",
	path = "doublewide_joker.png",
	px = 35,
	py = 95,
})

-- here's the animation code below. thank you benis

local upd = Game.update
local dt_table = {
	{ "j_mktjk_milky", 0.06, 11, 2 },
	{ "j_mktjk_mcparkour", 0.06, 19, 4 },
	{ "j_mktjk_flynn", 0.12, 15, 0, "loop", 0, 0 },
}

mktjk = {}
mktjk.path = "" .. SMODS.current_mod.path

--[[To use this:

1. Familarize yourself with dt_table:
- It is a table consisting of other small tables, which go like this {"object_key", "delta_time", "endX", "endY", "animateType", "startX", "startY"}
+ object_key: Used to tell the function what sprite to animate. 
+ delta_time: Basically being the "wait" inbetween every frame.
+ endX: Tell the code to skip to Y when X reaches endX.
+ endY: Tell the code to do its stuff when Y reaches endY, depending on animateType.
+ startX: The reverse of endX. Default is 0.
+ endX: The reverse of endX. Default is 0.
+ animateType:
  - "loop" (default): After running through the entire spritesheet, go back to x = 0, y = 0 and repeat the cycle.
  - "once": After running through the entire spritesheet, go back to x = 0, y = 0.
  - "random": x (0 to endX) and y (0 to endY) is changed randomly.

2. Add the card you want into dt_table, example is left below:
AddRunningAnimation({"j_joker",0.1,1,0}) <-- This probably won't work, see it as a format instead.

3. thats probably it, idk
]]

function GetRunningAnimations()
	return dt_table
end

function SetRunningAnimations(a)
	dt_table = a
end

function AddRunningAnimation(a)
	if type(a) == "table" then
		dt_table[#dt_table + 1] = a
	end
end

function Game:update(dt)
	upd(self, dt)
	if dt_table then
		for index, stuff in pairs(dt_table) do
			if not stuff["currentdt"] then
				stuff["currentdt"] = 0
			end
			stuff["currentdt"] = stuff["currentdt"] + dt
			if G.P_CENTERS and G.P_CENTERS[stuff[1]] and stuff["currentdt"] >= stuff[2] then
				stuff["currentdt"] = 0
				local obj = G.P_CENTERS[stuff[1]]
				local maxX = stuff[3] or 0
				local maxY = stuff[4] or 0
				local startX = stuff[6] or 0
				local startY = stuff[7] or 0
				local animateType = stuff[5] or "loop"
				if animateType ~= "loop" and animateType ~= "once" and animateType ~= "random" then
					print("Automatically setting this to loop, are you sure you did it right?: " .. animateType)
					animateType = "loop"
				end
				if animateType == "loop" or animateType == "once" then
					if obj.pos.x >= maxX and obj.pos.y >= maxY then
						obj.pos.x = startX
						obj.pos.y = startY
						if animateType == "once" then
							dt_table[index] = nil
							goto continue
						end
					elseif obj.pos.x < maxX then
						obj.pos.x = obj.pos.x + 1
					elseif obj.pos.y < maxY then
						obj.pos.x = startX
						obj.pos.y = obj.pos.y + 1
					end
				elseif animateType == "random" then
					obj.pos.x = math.random(startX, maxX)
					obj.pos.y = math.random(startY, maxY)
				end
			end
			::continue::
		end
	end
end

-- shaders

-- uncomment this when you finally figure out how to make partners

-- SMODS.Atlas {
-- key = "partners",
-- path = "mktpartners.png",
--px = 32,
-- py = 32,
-- }

-- this is where i register the rest of the sounds
-- register our sound, reference string will become 'mktjk_customsound'

SMODS.Sound({
	key = "dttg",
	path = "dttg.ogg",
})

SMODS.Sound({
	key = "fatty",
	path = "yttaf.ogg",
})

SMODS.Sound({
	key = "golshi",
	path = "golshi.ogg",
})

SMODS.Sound({
	key = "grievedih",
	path = "grievedih.ogg",
	pitch = 1.4,
})

SMODS.Sound({
	key = "ruisilly",
	path = "rui_silly.ogg",
})

SMODS.Sound({
	key = "wonderplush",
	path = "wonderhoy.ogg",
})

SMODS.Sound({
	key = "worldfuturestar",
	path = "worldfuturestar.ogg",
})

SMODS.Sound({
	key = "mreow",
	path = "meowstro.ogg",
	pitch = 1.0,
})

-- this is for setting the music for the aime joker

SMODS.Sound({
	key = "music_aimeboss",
	path = "aime_boss.ogg",
	select_music_track = function()
		return not (G.booster_pack_sparkles and not G.booster_pack_sparkles.REMOVED)
				and not (G.booster_pack_meteors and not G.booster_pack_meteors.REMOVED)
				and not (G.booster_pack and not G.booster_pack.REMOVED and not disable_booster_music)
				and not (G.shop and not G.shop.REMOVED)
				and G.GAME.blind
				and G.GAME.blind.boss
				and next(SMODS.find_card("j_mktjk_aimecard"))
				and 100
			or nil
	end,
})

SMODS.Sound({
	key = "music_aimemain",
	path = "aime_main.ogg",
	select_music_track = function()
		return not (G.booster_pack_sparkles and not G.booster_pack_sparkles.REMOVED)
				and not (G.booster_pack_meteors and not G.booster_pack_meteors.REMOVED)
				and not (G.booster_pack and not G.booster_pack.REMOVED and not disable_booster_music)
				and not (G.shop and not G.shop.REMOVED)
				and G.GAME.blind
				and not G.GAME.blind.boss
				and next(SMODS.find_card("j_mktjk_aimecard"))
				and 100
			or nil
	end,
})

SMODS.Sound({
	key = "music_aimeshop",
	path = "aime_shop.ogg",
	select_music_track = function()
		return not (G.booster_pack_sparkles and not G.booster_pack_sparkles.REMOVED)
				and not (G.booster_pack_meteors and not G.booster_pack_meteors.REMOVED)
				and not (G.booster_pack and not G.booster_pack.REMOVED and not disable_booster_music)
				and G.shop
				and (G.STATE == G.STATES.SHOP)
				and next(SMODS.find_card("j_mktjk_aimecard"))
				and 100
			or nil
	end,
})

--SMODS.Sound({
--    key = "music_aimebooster",
--    path = "aime_boosters.ogg",
--    select_music_track = function()
--        return (G.booster_pack_sparkles and not G.booster_pack_sparkles.REMOVED) or
--        (G.booster_pack_meteors and not G.booster_pack_meteors.REMOVED) or
--       (G.booster_pack and not G.booster_pack.REMOVED and not disable_booster_music)
--        and next(SMODS.find_card("j_mktjk_aimecard")) and 100 or nil
--    end
-- })

-- this one is specifically for rentarou

SMODS.Sound({
	key = "music_daisuki",
	path = "daisuki.ogg",
	select_music_track = function()
		return not (G.booster_pack_sparkles and not G.booster_pack_sparkles.REMOVED)
				and not (G.booster_pack_meteors and not G.booster_pack_meteors.REMOVED)
				and not (G.booster_pack and not G.booster_pack.REMOVED and not disable_booster_music)
				and not (G.shop and not G.shop.REMOVED)
				and G.GAME.blind
				and G.GAME.blind.boss
				and next(SMODS.find_card("j_mktjk_rentarouaijou"))
				and 100
			or nil
	end,
})

-- make the object type for all milky jokers
SMODS.ObjectType({
	key = "milkys_jokers",
	default = "j_mktjk_milky",
	cards = {},
	rarities = {
		{ key = "Common", rate = 0.7 },
		{ key = "Uncommon", rate = 0.25 },
		{ key = "Rare", rate = 0.05 },
		{ key = "Legendary", rate = 0 },
	},
})

if not SMODS.ObjectTypes.Food then
	SMODS.ObjectType({
		key = "Food",
		default = "j_egg",
		cards = {
			j_gros_michel = true,
			j_selzer = true,
			j_egg = true,
			j_ice_cream = true,
			j_popcorn = true,
			j_cavendish = true,
			j_turtle_bean = true,
			j_diet_cola = true,
			j_ramen = true,
		},
	})
end

local NFS = require("nativefs")
to_big = to_big or function(a)
	return a
end
lenient_bignum = lenient_bignum or function(a)
	return a
end

-- loading folders for jokers, vouchers, decks, seals, etc.

-- loading folders for jokers, by rarity
local function load_jokers_jimmy_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers/0_jimmy"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/0_jimmy/" .. file_name))()
		end
	end
end

local function load_jokers_common_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers/1_common"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/1_common/" .. file_name))()
		end
	end
end

local function load_jokers_uncommon_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers/2_uncommon"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/2_uncommon/" .. file_name))()
		end
	end
end

local function load_jokers_rare_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers/3_rare"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/3_rare/" .. file_name))()
		end
	end
end

local function load_jokers_epic_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers/3a_epic"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/3a_epic/" .. file_name))()
		end
	end
end

local function load_jokers_legendary_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers/4_legendary"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/4_legendary/" .. file_name))()
		end
	end
end

local function load_jokers_legendaryplus_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers/4a_legendaryplus"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/4a_legendaryplus/" .. file_name))()
		end
	end
end

local function load_jokers_meta_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers/5_meta"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/5_meta/" .. file_name))()
		end
	end
end

local function load_jokers_folder()
	local mod_path = SMODS.current_mod.path
	local jokers_path = mod_path .. "/content/jokers"
	local files = NFS.getDirectoryItemsInfo(jokers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/jokers/" .. file_name))()
		end
	end
end

local function load_rarities_file()
	local mod_path = SMODS.current_mod.path
	assert(SMODS.load_file("rarities.lua"))()
end

local function load_vouchers_folder()
	local mod_path = SMODS.current_mod.path
	local vouchers_path = mod_path .. "/content/vouchers"
	local files = NFS.getDirectoryItemsInfo(vouchers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/vouchers/" .. file_name))()
		end
	end
end

local function load_decks_folder()
	local mod_path = SMODS.current_mod.path
	local vouchers_path = mod_path .. "/content/decks"
	local files = NFS.getDirectoryItemsInfo(vouchers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/decks/" .. file_name))()
		end
	end
end

local function load_seals_folder()
	local mod_path = SMODS.current_mod.path
	local vouchers_path = mod_path .. "/content/seals"
	local files = NFS.getDirectoryItemsInfo(vouchers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/seals/" .. file_name))()
		end
	end
end

local function load_blinds_folder()
	local mod_path = SMODS.current_mod.path
	local vouchers_path = mod_path .. "/content/blinds"
	local files = NFS.getDirectoryItemsInfo(vouchers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/blinds/" .. file_name))()
		end
	end
end

local function load_editions_folder()
	local mod_path = SMODS.current_mod.path
	local vouchers_path = mod_path .. "/content/editions"
	local files = NFS.getDirectoryItemsInfo(vouchers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/editions/" .. file_name))()
		end
	end
end

local function load_boosters_folder()
	local mod_path = SMODS.current_mod.path
	local vouchers_path = mod_path .. "/content/boosters"
	local files = NFS.getDirectoryItemsInfo(vouchers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/boosters/" .. file_name))()
		end
	end
end

local function load_tags_folder()
	local mod_path = SMODS.current_mod.path
	local vouchers_path = mod_path .. "/content/tags"
	local files = NFS.getDirectoryItemsInfo(vouchers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("content/tags/" .. file_name))()
		end
	end
end

local function load_crossmod_folder()
	local mod_path = SMODS.current_mod.path
	local vouchers_path = mod_path .. "/crossmod"
	local files = NFS.getDirectoryItemsInfo(vouchers_path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file("crossmod/" .. file_name))()
		end
	end
end

load_jokers_jimmy_folder()
load_jokers_common_folder()
load_jokers_uncommon_folder()
load_jokers_rare_folder()
load_jokers_epic_folder()
load_jokers_legendary_folder()
load_jokers_legendaryplus_folder()
load_jokers_meta_folder()
load_jokers_folder()

load_rarities_file()
load_vouchers_folder()
load_decks_folder()
load_seals_folder()
load_blinds_folder()
load_editions_folder()
load_boosters_folder()
load_tags_folder()
load_crossmod_folder()

assert(SMODS.load_file("titlescreen.lua"))()
assert(SMODS.load_file("ui.lua"))()

-- i dont know why this is in main.lua but it doesnt work any other way

local cardclickref = Card.click
function Card:click()
	cardclickref(self)
	if self.config.center.key == "j_mktjk_donttapthejoker" then
		SMODS.destroy_cards(self)
	end
end

local shatterref = SMODS.shatters
function SMODS.shatters(card)
	if card.config.center.key == "j_mktjk_donttapthejoker" then
		return true
	end
	return shatterref(card)
end

local cardshatterref = Card.shatter
function Card:shatter()
    cardshatterref(self)
    if SMODS.has_enhancement(self, "m_glass") then
        SMODS.calculate_context({mktjk_glass_broken = true})
    end
end

-- date calc
function SinceDay(year, month, day)
	local now = os.date("*t")
	local then_time = os.time({ year = year, month = month, day = day, hour = 0 })
	local diff = os.difftime(os.time(now), then_time)
	return math.floor(diff / (60 * 60 * 24))
end
