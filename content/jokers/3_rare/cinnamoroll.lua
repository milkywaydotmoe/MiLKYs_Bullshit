SMODS.Joker{ --Cinnamoroll
    key = "cinnamoroll",
    config = {
        extra = {
            increment = 0.2,
            chipmoroll = 1
        }
    },

    loc_txt = {
        ['name'] = 'Cinnamoroll',
        ['text'] = {
            'Gains {X:blue,C:white}#1#X{} {C:blue}Chips{} when a',
            '{C:attention}Food Joker{} is {C:attention}\"eaten\"{} {C:inactive}(destroyed){}',
            '{C:inactive}(Currently {}{X:blue,C:white}#2#X{}{C:inactive} Chips){}',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },

    pos = {
        x = 4,
        y = 7
    },

    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.increment, card.ability.extra.chipmoroll } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_type_destroyed and (context.card.config.center.pools or {}).Food then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chipmoroll",
                scalar_value = "increment",
            })
            return {
                message = localize("k_upgrade_ex")
            }
        end

        if context.cardarea == G.jokers and context.joker_main then
            return {
                    x_chips = card.ability.extra.chipmoroll
                }
        end
    end
}