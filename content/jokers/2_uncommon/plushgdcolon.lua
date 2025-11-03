SMODS.Joker{ --Plush GD Colon
    key = "plushgdcolon",
    config = {
        extra = {
            xchips = 3
        }
    },
    loc_txt = {
        ['name'] = 'Plush GD Colon',
        ['text'] = {
            [1] = 'If hand contains a',
            [2] = 'scoring {C:attention}3, 4, 5, 6 {}or {C:attention}8{},',
            [3] = 'gives {X:blue,C:white}X3{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    cost = 7,
    rarity = 2,
    pronouns = 'he_him',
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
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 3 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() or (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 4 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() or (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 5 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() or (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 6 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 8 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}