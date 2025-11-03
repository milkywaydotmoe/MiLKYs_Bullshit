SMODS.Joker{ --???????
    key = "victory",
    config = {
        extra = {
            WELOVEIT = 1.18
        }
    },
    loc_txt = {
        ['name'] = '???????',
        ['text'] = {
            [1] = 'Every scored {C:attention}Steel{} Card',
            [2] = 'gives {X:red,C:white}#1#X{} Mult',
            [3] = '',
            [4] = '{s:1.7}WE LOVE IT!{}',
            [5] = '{s:0.8}CHASE THE SUPER PLATINUM AND{}',
            [6] = '{s:0.8}BECOME A MONSTER TO SURVIVE MURDER{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    pronouns = "they_them",
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { ["milkys_jokers"] = true },

    loc_vars = function(self, queue, card)
        queue[#queue+1] = {key = 'mktjk_credit_pooper', set = 'Other'}
        return {vars = {card.ability.extra.WELOVEIT}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                return {
                    Xmult = card.ability.extra.WELOVEIT
                }
            end
        end
    end
}