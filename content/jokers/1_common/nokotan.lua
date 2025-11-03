SMODS.Joker{ --{f:5}のこたん
    key = "nokotan",
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = '{f:5}のこたん',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult.',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    loc_vars = function (self, queue, card)
        queue[#queue+1] = {key = 'mktjk_nokotan_name', set = 'Other'}
        return {vars = {card.ability.extra.Xmult}}
    end,
    pronouns = "she_her",
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { ["milkys_jokers"] = true },

    calculate = function(self, card, context)
        if context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
    end
}