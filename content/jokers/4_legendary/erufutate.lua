SMODS.Joker{ --Eru Futate
    key = "erufutate",
    config = {
        extra = {
            Xmult = 22
        }
    },
    loc_txt = {
        ['name'] = '{f:5}双天 彗流',
        ['text'] = {
            '{C:white,X:mult}X#1#{} Mult if played hand',
            'contains a {C:attention}Pair'
        }
    },
    loc_vars = function (self, queue, card)
        queue[#queue+1] = {key = 'mktjk_erufutate_name', set = 'Other'}
        return {vars = {card.ability.extra.Xmult}}
    end,
    pos = {
        x = 1,
        y = 0
    },
    pronouns = "she_her",
    cost = 22,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Pair"]) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}
