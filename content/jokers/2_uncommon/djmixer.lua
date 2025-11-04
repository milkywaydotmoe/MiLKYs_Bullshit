SMODS.Joker{ --DJ Mixer
    key = "djmixer",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'DJ Mixer',
        ['text'] = {
            [1] = 'Gives {C:red}+24{} Mult on its own.',
            [2] = 'Additionally gives {X:red,C:white}2X{} ',
            [3] = 'Mult when surrounded by',
            [4] = '{C:attention}2 DJ Deck{} Jokers'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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