SMODS.Joker{ --Astro
    key = "scrap",
    config = {
        extra = {
            multadd = 0.1,
            mult = 0.1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.multadd, card.ability.extra.mult}}
    end,

    loc_txt = {
        ['name'] = 'Scrap',
        ['text'] = {
            'Played cards give {C:mult}+#2#{}',
            'Mult when scored,',
            'increases by {C:attention}+#1#{}',
            'at end of round',
            '{C:attention}Meows{} when you do',
            'almost anything'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 7
    },
    pronouns = "he_him",
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if G.GAME.round_resets.ante >= 8 then
                return {
                    message = "mrrrreow!!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                    extra = {
                        mult = card.ability.extra.mult,
                        colour = G.C.DARK_EDITION,
                        }
                }
            else
                return {
                    mult = card.ability.extra.mult,
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
            end
        end
        if context.starting_shop  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            if not context.blueprint then
                card.ability.extra.mult = (card.ability.extra.mult) + (card.ability.extra.multadd)
            end
            return {
                message = "mreow!",
                sound = play_sound('mktjk_mreow', 1.0, 0.5),
                extra = {
                    colour = G.C.GREEN
                    }
            }
        end
        if context.after and context.cardarea == G.jokers  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.reroll_shop  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.other_joker  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.skip_blind  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.hand_drawn  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.discard  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.open_booster  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.skipping_booster  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.playing_card_added  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.using_consumeable  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
        if context.ending_shop  then
                return {
                    message = "mreow!",
                    sound = 'mktjk_mreow',
                    pitch = 0.5,
                }
        end
    end
}