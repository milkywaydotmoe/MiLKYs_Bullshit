SMODS.Joker{ --Instant Photochad
    key = "instantphotochad",
    config = {
        extra = {
            xtwomult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Instant Photochad',
        ['text'] = {
            'Retrigger {C:attention}first{} played card used',
            'in scoring {C:attention}#1#{} additional times',
            'and give {X:red,C:white}X#1#{} Mult if first',
            'played card is a {C:attention}face{}.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    pronouns = "it_its",
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    soul_pos = {x = 0, y = 5},
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },
    draw = function (self, card, layer)
        if card.children.center then
            rotate_mod = math.sin(G.TIMERS.REAL * 1.9) * 0.01
            local sc = -0.1
            local xm = 0
            local ym = (-0.02 * (math.sin(G.TIMERS.REAL)/2)) - G.CARD_H + 0.6
            card.children.center:draw_shader('dissolve', 0, nil,true,card.children.center,sc, rotate_mod,xm,ym+0.2,nil, 0.6)
            card.children.center:draw_shader('dissolve', nil, nil,true,card.children.center,sc, rotate_mod,xm,ym,nil, 0.6)
        end

    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xtwomult}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = card.ability.extra.xtwomult,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] and context.other_card:is_face()) then
                return {
                    Xmult = card.ability.extra.xtwomult
                }
            end
        end
    end
}