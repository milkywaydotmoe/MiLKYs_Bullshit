SMODS.Joker{ --Chunithe Sol
    key = "chunithesol",
    config = {
        extra = {
            xchips = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Chunithe Sol',
        ['text'] = {
            [1] = 'Scored {C:attention}red{} suits give',
            [2] = '{X:chips,C:white}#1#x{} Chips each.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    pronouns = "he_they",
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips}}
    end,
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

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
    local suitFound = false
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Hearts") or c:is_suit("Diamonds") then
            suitFound = true
            break
        end
    end
    
    return suitFound
end)() then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}