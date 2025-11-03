SMODS.Joker{ --Double Wide Joker
    key = "doublewidejoker",
    config = {
        extra = {
            mult = 5
        },
        extra_slots_used = 1,
    },
    loc_txt = {
        ['name'] = 'Double Wide Joker',
        ['text'] = {
            '{C:red}+#1#{} Mult for every Pair',
            'included in played hand.',
            'Takes up 2 Joker slots.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 35 * 2.12, 
        h = 95 * 1
    },
    pronouns = 'he_him',
    cost = 7,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = '2widejoker',
    pools = { 
        ["milkys_jokers"] = true 
    },

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            -- count pairs in played hand
            local pairs = 0
            for i = 1, #G.play.cards - 1 do
                for j = i + 1, #G.play.cards do
                    if G.play.cards[i]:get_id() == G.play.cards[j]:get_id() then
                        pairs = pairs + 1
                    end
                end
            end

            return {
                mult = pairs * card.ability.extra.mult
            }
        end
    end,
}