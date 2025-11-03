SMODS.Joker{ --iFlash Quad
    key = "iflashquad",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'iFlash Quad',
        ['text'] = {
            [1] = '{C:attention}+4{} hand size.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    pronouns = "it_its",
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
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(4)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-4)
    end
}