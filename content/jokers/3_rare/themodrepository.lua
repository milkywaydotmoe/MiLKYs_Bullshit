function get_commit_count()
    local url = "https://api.github.com/repos/milkywaydotmoe/mktjokers/commits?per_page=1"
    local last_page

    -- Use curl to get just the headers
    local handle = io.popen(
        'curl -s -I "' .. url .. '" -H "User-Agent: Lua" -H "Accept: application/vnd.github.v3+json" 2>nul'
    )

    local headers = handle and handle:read("*a") or ""
    if handle then handle:close() end

    -- Extract the "last" page number from the Link header (if present)
    last_page = headers:match('page=(%d+)>;%s*rel="last"')

    -- Fallback to default 166 if nothing found or offline
    _G.mktjk_commitcount = tonumber(last_page) or 166

    print("Commit count:", _G.mktjk_commitcount)
end

get_commit_count()


SMODS.Joker{ --The Mod Repository
    key = "themodrepository",
    config = {
        extra = {
            commitcount = _G.mktjk_commitcount
        }
    },
    loc_txt = {
        ['name'] = 'The Mod Repository',
        ['text'] = {
            [1] = 'Gains {C:red}Mult{} based on how',
            [2] = 'many commits are in the',
            [3] = '{C:attention}Milky\'s Bullshit{} repository',
            [4] = '{C:inactive}(currently {}{C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.commitcount}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.commitcount
            }
        end
    end
}