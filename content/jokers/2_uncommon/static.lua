SMODS.Joker{ --Static
    key = "static",
    config = {
        extra = {
            staticmiku = 123
        }
    },
    loc_txt = {
        ['name'] = 'Static',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips if played hand',
            [2] = 'contains {C:attention}Face Cards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.staticmiku}}
    end,
    pos = {
        x = 6,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    pronouns = 'she_her',
    cost = 6,
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
            -- give xmult 
            if context.joker_main then
                local cardswithfaces = {}
                -- local jackCount = 0
                -- local queenCount = 0
                -- local kingCount = 0

                for _, card in ipairs(context.scoring_hand) do
                    if card:is_face() then
                        local id = card:get_id()
                            if cardswithfaces[id] then
                                cardswithfaces[id] = cardswithfaces[id] + 1
                            else
                                cardswithfaces[id] = 1
                            end
                    end
                -- print(cardswithfaces)
                    -- if card:get_id() == 11 then --counting jacks
                    --     jackCount = jackCount + 1
                    -- end
                    -- if card:get_id() == 12 then -- counting queens
                    --     queenCount = queenCount + 1
                    -- end
                    -- if card:get_id() == 13 then -- counting queens
                    --     kingCount = kingCount + 1
                    -- end
                end

                -- if jackCount >= 3 or queenCount >= 3 or kingCount >= 3 then
                for _, numberofcards in pairs(cardswithfaces) do
                    -- print(numberofcards)
                    if numberofcards >= 1 then
                    return {
                        chips = card.ability.extra.staticmiku,
                        message = 'This is how it should be!'
                    }
                end
            end
        end 
    end
}