SMODS.Joker{ --Divine Dream Cookie
    key = "divinedreamcookie",
    config = {
        extra = {
            xmultvar = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.xmultvar } 
        }
    end,
    loc_txt = {
        ['name'] = 'Divine Dream Cookie',
        ['text'] = {
            'This Joker gains {C:white,X:mult}X0.5{} Mult for',
            'each {C:attention}Queen{} discarded this round',
            '{C:inactive}(Currently {C:white,X:mult}X#1#{} {C:inactive}Mult)',
            '{C:inactive,s:0.8}art by {X:edition,C:spades}HATTOYUME'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    pronouns = "she_they",
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    calculate = function(self, card, context)
        if context.discard and not context.blueprint and
            not context.other_card.debuff and
            context.other_card:get_id() == 12 then
            card.ability.extra.xmultvar = card.ability.extra.xmultvar + 0.5
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmultvar } },
                colour = G.C.RED
            }
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