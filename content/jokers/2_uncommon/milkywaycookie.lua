SMODS.Joker{ --Milky Way Cookie
    key = "milkywaycookie",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Milky Way Cookie',
        ['text'] = {
            [1] = 'Retriggers the {C:attention}last{} card once',
            [2] = 'for every Joker owned.',
            [3] = '{C:inactive}(Currently{} {C:attention}#1#{} {C:inactive}Retriggers){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    soul_pos = {
        x = 9,
        y = 6
    },
    pronouns = 'she_her',
    cost = 7,
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
        return {vars = {card.ability.extra.jokercount + (#(G.jokers and (G.jokers and G.jokers.cards or {}) or {}))}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                return {
                    repetitions = card.ability.extra.jokercount + (#(G.jokers and G.jokers.cards or {})),
                    message = "Choo Choo!!!"
                }
            end
        end
    end
}