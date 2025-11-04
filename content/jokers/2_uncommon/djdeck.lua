SMODS.Joker{ --DJ Deck
    key = "djdeck",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'DJ Deck',
        ['text'] = {
            [1] = '{C:red}+12{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 8
    },
    pronouns = 'it_its',
    cost = 5,
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

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
        end
    end
}