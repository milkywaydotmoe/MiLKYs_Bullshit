SMODS.Joker{ -- MiLKY-P
    key = "milky",
    config = {
        extra = {
            other_dt = 0
        }
    },
    loc_txt = {
        ['name'] = 'MiLKY-P',
        ['text'] = {
            'Applies a random',
            '{C:enhanced}Enhancement{}, {C:dark_edition}Edition{}, and',
            '{C:attention}Seal{} to scored cards',
            '',
            '{C:inactive}The self-insert of all time'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2,
    },
    soul_pos = {x = 0, y = 3, draw=function (card, scale_mod, rotate_mod)
        if card.children.floating_sprite then
            card.children.floating_sprite.T.w = 1.4
            rotate_mod = -G.TIMERS.REAL * 0.635
            local sc = 0
            local xm = 0
            local ym = (-0.15 * (math.sin(G.TIMERS.REAL)/2)) - 0.355
            card.children.floating_sprite:draw_shader('dissolve', 0, nil,nil,card.children.center,sc, rotate_mod,xm,ym+0.2,nil, 0.6)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil,nil,card.children.center,sc, rotate_mod,xm,ym,nil, 0.6)
        end
    end},
    pronouns = "she_theyxhey",
    cost = 39,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'selfinsert',
    in_pool = function (self, args)
        return not args or args.source ~= "mktjk_milky_pack"
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                local enhancement_pool = {}
                for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                    if enhancement.key ~= 'm_stone' then
                        enhancement_pool[#enhancement_pool + 1] = enhancement
                    end
                end
                local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                context.other_card:set_ability(random_enhancement)
                local random_seal = SMODS.poll_seal({mod = 10})
                if random_seal then
                    context.other_card:set_seal(random_seal, true)
                end
                local options = {}
                for _, edition_info in ipairs(G.P_CENTER_POOLS.Edition) do
                    if edition_info.key ~= "e_negative" then
                        options[#options+1] = {name = edition_info.key, weight = 1}
                    end
                end
                local random_edition = poll_edition("key", nil, true, true, options)
                context.other_card:set_edition(random_edition, true)
                return {
                    message = "Card Modified!"
                }
        end
    end
}