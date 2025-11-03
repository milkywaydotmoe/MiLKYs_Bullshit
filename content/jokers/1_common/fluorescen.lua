SMODS.Joker{ --Fluo Rescen
    key = "fluorescen",
    config = {
        extra = {
            bweh = 1,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Fluo Rescen',
        ['text'] = {
            [1] = 'Gives {X:edition,C:white}3x{} Bweh',
            [2] = '{C:inactive,s:0.9}(Currently #1# Bweh :3){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 0.7, 
        h = 95 * 0.7
    },
    pronouns = "they_them",
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { ["milkys_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.bweh}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                card.ability.extra.bweh = (card.ability.extra.bweh) * 3
                return {
                    message = "Bweh! :3"
                }
        end
    end
}