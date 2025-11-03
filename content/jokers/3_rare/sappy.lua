SMODS.Joker{ --sappy
    key = "sappy",
    config = {
        extra = {
            slime_mult = 1,
            slime_mod = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Sappy',
        ['text'] = {
            [1] = 'Destroys all unscored',
            [2] = 'cards and gains {X:red,C:white}#2#X{} Mult',
            [3] = 'for every card destroyed',
            [4] = '{C:inactive}(Currently {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    pronouns = "he_him",
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { ["milkys_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.slime_mult, card.ability.extra.slime_mod}}
    end,

    calculate = function(self, card, context)
        if context.joker_main and to_big(card.ability.extra.xmult) > to_big(1) then
            return {
                x_mult = card.ability.extra.xmult
            }
        end

        if context.destroy_card and context.cardarea == "unscored" then
            context.destroy_card.slime_removal = true
            return {remove = true}
        end

        if context.remove_playing_cards and not context.blueprint then
            local count = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card.slime_removal then count = count + 1 end
            end
            if count > 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "slime_mult",
                    scalar_value = "slime_mod",
                    operation = function(ref_table, ref_value, initial, scaling)
                        ref_table[ref_value] = initial + count*scaling
                    end,
                    scaling_message = {
                        message = "get slimed, idiot!"
                    }
                })
            end
        end
    end
}