SMODS.Joker{ --Milkys Fuckass Plushie
    key = "milkysplush",
    config = {
        extra = {
            Xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Milkys Fuckass Plushie',
        ['text'] = {
            [1] = 'Played {C:attention}Aces{} give {C:white,X:mult}X#1#{}',
            [2] = 'Mult when scored'
        },
    },
    pos = {
        x = 1,
        y = 2
    },
    soul_pos = {x = 2, y = 2, draw=function (card, scale_mod, rotate_mod)
        if card.children.floating_sprite then
            card.children.floating_sprite.T.w = 1.4
            local sc = -0.1
            local xm = -0.02
            local ym = -0.04
            card.children.floating_sprite:draw_shader('dissolve', 0, nil,nil,card.children.center,sc, rotate_mod,xm,ym+0.1,nil, 0.6)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil,nil,card.children.center,sc, rotate_mod,xm,ym,nil, 0.6)
        end
    end},
    loc_vars = function(self, queue, card) return {
        vars = {
            card.ability.extra.Xmult
        }
    } end,
    pronouns = "she_theyxhey",
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "Wonderhoy!",
                    sound = 'mktjk_wonderplush'
                }
            end
        end
    end
}