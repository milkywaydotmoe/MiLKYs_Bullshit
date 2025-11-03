SMODS.Joker{ --stellegoe :3
    key = "stellegoe",
    config = {
        extra = {
            chips = 3.9
        }
    },
    loc_txt = {
        ['name'] = 'stellegoe :3',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    pos = {
        x = 1,
        y = 4
    },
    pronouns = next(SMODS.find_mod("cryptposting")) and "bulgoe" or 'they_them',
    cost = 4,
    rarity = 1,
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
                return {
                    chips = card.ability.extra.chips
                }
        end
    end
}