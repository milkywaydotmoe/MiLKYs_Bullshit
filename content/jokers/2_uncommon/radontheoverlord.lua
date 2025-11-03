SMODS.Joker{ --RADON, THE OVERLORD.
    key = "radontheoverlord",
    config = {
        extra = {
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'RADON, THE OVERLORD.',
        ['text'] = {
            '{C:green}#1# in #2#{} chance to',
            'enhance card into {C:attention}Steel{}',
            'when scored.',
            '',
            '{C:red,s:1.3}PREPARE FOR YOUR DOOM!!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    rarity = 2,
    pronouns = he_him,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'radon',
    pools = { 
        ["milkys_jokers"] = true 
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_mktjk_radontheoverlord') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_db1d48ce', 1, card.ability.extra.odds, 'j_mktjk_radontheoverlord', false) then
                    context.other_card:set_ability(G.P_CENTERS.m_steel)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                    end
                end
            end
        end
}