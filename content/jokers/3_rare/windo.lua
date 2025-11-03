SMODS.Joker{ --Windo
    key = "windo",
    config = {
        extra = {
            multiplier_wd = 1.35
        }
    },
    loc_txt = {
        ['name'] = 'Windo',
        ['text'] = {
            'Balances {C:blue}Chips{} and {C:red}Mult{} and',
            'multiplies both by {X:attention,C:white}X#1#{}'
        },
        ['unlock'] = {
            'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    soul_pos = {
        x = 1,
        y = 6
    },
    pronouns = "he_him",
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { ["milkys_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.multiplier_wd}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    balance = true,
                    extra = {
                        x_chips = card.ability.extra.multiplier_wd,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            Xmult = card.ability.extra.multiplier_wd
                        }
                        }
                }
        end
    end
}