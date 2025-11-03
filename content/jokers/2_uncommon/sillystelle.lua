SMODS.Joker{ --Silly Stelle Steelbrooke
    key = "sillystelle",
    config = {
        extra = {
            xmultvar = 1,
            xmultadd = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Silly Stelle Steelbrooke',
        ['text'] = {
            [1] = 'This Joker gains {C:white,X:mult}X#2#{} Mult per',
            [2] = '{C:attention}consecutive{} card played',
            [3] = '{C:inactive}(Resets at end of round)',
            [4] = '{C:inactive}(Currently{} {C:white,X:mult}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    pronouns = "they_them",
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmultvar, card.ability.extra.xmultadd}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + card.ability.extra.xmultadd
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmultvar
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.xmultvar = 1
                    return true
                end
                }
        end
    end
}
