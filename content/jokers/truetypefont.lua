local function get_font_count()
    local count = 0
    local cmd

    -- Detect OS from package.config (Windows has '\' as dir separator)
    if package.config:sub(1,1) == "\\" then
        -- Windows
        local fontsPath = os.getenv("WINDIR") .. "\\Fonts"
        cmd = string.format('cmd /C dir "%s" /b /a-d | find /c /v ""', fontsPath)

    else
        -- Detect macOS or Linux
        local uname = io.popen("uname"):read("*l")
        if uname == "Darwin" then
            -- macOS
            cmd = [[bash -c 'find /System/Library/Fonts /Library/Fonts ~/Library/Fonts -type f 2>/dev/null | wc -l']]
        else
            -- Linux
            cmd = [[bash -c 'find /usr/share/fonts /usr/local/share/fonts ~/.fonts -type f 2>/dev/null | wc -l']]
        end
    end

    local handle = io.popen(cmd)
    if handle then
        local output = handle:read("*a")
        handle:close()
        count = tonumber(output:match("%d+")) or 0
    end

    return count
end

-- Push font count to global
_G.mktjk_fontcount = get_font_count()

-- Determine font level
local function get_font_level(count)
    if count < 400 then
        return 1
    elseif count < 600 then
        return 2
    elseif count < 1500 then
        return 3
    else
        return 4
    end
end

-- Determine font price
local function get_font_price(count)
    if count < 400 then
        return 4
    elseif count < 600 then
        return 6
    elseif count < 1500 then
        return 8
    else
        return 15
    end
end

-- Push to globals
_G.mktjk_fontlevel = get_font_level(_G.mktjk_fontcount)
_G.mktjk_fontprice = get_font_price(_G.mktjk_fontcount)

SMODS.Joker{ --TrueType Font
    key = "truetypefont",
    config = {
        extra = {
            fonts_installed = _G.mktjk_fontcount
        }
    },
    loc_txt = {
        ['name'] = 'TrueType Font',
        ['text'] = {
            [1] = 'Add {C:blue}Chips{} equal to',
            [2] = 'amount of fonts',
            [3] = '{C:attention}installed{} on system',
            [4] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    pronouns = "they_them",
    cost = _G.mktjk_fontprice,
    rarity = _G.mktjk_fontlevel,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.fonts_installed}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.fonts_installed
            }
        end
    end
}