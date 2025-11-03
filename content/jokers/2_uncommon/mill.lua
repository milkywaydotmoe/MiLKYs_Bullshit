SMODS.Joker{ -- Mill the Romcom Angel
    key = "mill",
    config = {
        extra = {
            Xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Mill the Romcom Angel',
        ['text'] = {
            [1] = '{C:white,X:mult}X#1#{} Mult if played hand',
            [2] = 'contains both a {C:attention}King{} and {C:attention}Queen'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    loc_vars = function(self, queue, card) return {
        vars = {
            card.ability.extra.Xmult
        }
    } end,
    pos = {
        x = 8,
        y = 2
    },
    pronouns = "she_her",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 13 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 12 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}