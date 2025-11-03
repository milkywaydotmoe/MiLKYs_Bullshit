SMODS.Joker { -- The Comedian
    key = "thecomedian",
    config = {
        extra = {
            Xmult = 10,
            odds = 10000
        }
    },
    loc_txt = {
        ['name'] = 'The Comedian',
        ['text'] = {
            '{C:white,X:mult}X#1#{} Mult',
            '{C:green}#1# in #2#{} chance this card is',
            'destroyed at the end of round'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    pronouns = "it_its",
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    in_pool = function() return G.GAME.pool_flags.cavendish_extinct end,

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_thecomedian') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_9acfd6c7', 1, card.ability.extra.odds, 'j_modprefix_thecomedian') then
                      SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                  end
            end
        end
    end
}
