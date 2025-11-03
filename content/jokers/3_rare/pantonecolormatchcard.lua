SMODS.Joker{ --Pantone Color Match Card
    key = "pantonecolormatchcard",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Pantone Color Match Card',
        ['text'] = {
            [1] = 'If played hand contains',
            [2] = 'a {C:attention}Flush{}, then convert',
            [3] = 'all cards held in hand',
            [4] = 'into a {C:attention}random{} suit'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 7
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Flush"]) then
            end
        end
    end
}