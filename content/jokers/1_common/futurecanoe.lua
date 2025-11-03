SMODS.Joker{ --FutureCanoe
    key = "futurecanoe",
    config = {
        extra = {
            card_tehn = 10
        }
    },
    loc_txt = {
        ['name'] = 'FutureCanoe',
        ['text'] = {
            [1] = '{C:red}+#1# {}Mult if played hand',
            [2] = 'contains a numbered card',
            [3] = 'between {C:attention}2 and Tehn{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    soul_pos = {
        x = 3,
        y = 5
    },
    pronouns = "he_him",
    cost = 6,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.card_tehn}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if (c:get_id() == 2 or c:get_id() == 4 or c:get_id() == 6 or c:get_id() == 8 or c:get_id() == 10) then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() or (function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if (c:get_id() == 14 or c:get_id() == 3 or c:get_id() == 5 or c:get_id() == 7 or c:get_id() == 9) then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                return {
                    mult = card.ability.extra.card_tehn
                }
            end
        end
    end
}