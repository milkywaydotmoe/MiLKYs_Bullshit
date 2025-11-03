SMODS.Joker{ -- Flynn
    key = "flynn",
    config = {
        extra = {
            flynnMult = 1,
            flynncrement = 0.3,
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Flynn, the Destroyer',
        ['text'] = {
            [1] = '{C:green}#3#{} in {C:green}#4#{} chance for Flynn',
            [2] = 'to spear the {C:attention}last{} card in',
            [3] = 'your {C:attention}played hand{}, destroying',
            [4] = 'it. Gains {X:red,C:white}#2#X{} Mult for every',
            [5] = 'card destroyed this way.',
            [6] = '',
            [7] = '{C:inactive}(Currently {}{X:red,C:white}#1#X{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0,
    },
    soul_pos = {x = 0, y = 1, draw=function (card, scale_mod, rotate_mod)
        if card.children.floating_sprite then
            card.children.floating_sprite.T.w = 1.4
            rotate_mod = 0
            local sc = 0
            local xm = -0.02
            local ym = -0.1
            card.children.floating_sprite:draw_shader('dissolve', 0, nil,nil,card.children.center,sc, rotate_mod,xm,ym+0.11,nil, 0.6)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil,nil,card.children.center,sc, rotate_mod,xm,ym,nil, 0.6)
        end
    end},
    pronouns = "they_them",
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'flynn',
    pools = { 
        ["milkys_jokers"] = true 
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_mktjk_flynn') 
        return {vars = {card.ability.extra.flynnMult, card.ability.extra.flynncrement, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                if SMODS.pseudorandom_probability(card, 'group_0_f83da17d', 1, card.ability.extra.odds, 'j_mktjk_flynn', false) then
                    card.ability.extra.flynnMult = (card.ability.extra.flynnMult) + card.ability.extra.flynncrement
                    
                end
                if SMODS.pseudorandom_probability(card, 'group_1_f83da17d', 1, card.ability.extra.odds, 'j_mktjk_flynn', false) then
                    context.other_card.should_destroy = true
                    card.ability.extra.flynnMult = (card.ability.extra.flynnMult) + card.ability.extra.flynncrement
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Speared!", colour = G.C.RED})
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.flynnMult
            }
        end
    end
}