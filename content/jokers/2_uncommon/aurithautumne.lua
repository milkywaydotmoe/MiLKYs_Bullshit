SMODS.Joker{ --Aurith Autumne
    key = "aurithautumne",
    config = {
        extra = {
            autumnbux = 7
        }
    },
    loc_txt = {
        ['name'] = 'Aurith Autumne',
        ['text'] = {
            [1] = 'Earn {C:gold}$#1#{} if played hand',
            [2] = 'contains both a {C:attention}scoring{}',
            [3] = '{C:clubs}Club{} card and a scoring',
            [4] = '{C:diamonds}Diamond{} card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    pronouns = "she_they",
    cost = 7,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.autumnbux}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local suitFound = false
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Diamonds") then
            suitFound = true
            break
        end
    end
    
    return suitFound
end)() and (function()
    local suitFound = false
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Clubs") then
            suitFound = true
            break
        end
    end
    
    return suitFound
end)()) then
                return {
                    dollars = card.ability.extra.autumnbux
                }
            end
        end
    end
}