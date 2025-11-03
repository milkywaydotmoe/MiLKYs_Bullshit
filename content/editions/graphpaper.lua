SMODS.Enhancement {
    key = 'graphpaper',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            x_chips = 2
        }
    },
    loc_txt = {
        name = 'Graph Paper',
        text = {
            [1] = '{C:white,X:chips}X#1#{} Chips'
        }
    },

    loc_vars = function(self, queue, card)
        return {
            vars = {card.ability.extra.x_chips}
        }
    end,

    atlas = 'editions',
    any_suit = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = false,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_chips = card.ability.extra.x_chips
            }
        end
    end
}
