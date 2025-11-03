SMODS.Joker{ --Pantone Color Match Card
    key = "pantonecolormatchcard",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Pantone Color Match Card',
        ['text'] = {
            [1] = 'If played hand contains',
            [2] = 'a {C:attention}Flush{}, then convert',
            [3] = 'all cards held in hand',
            [4] = 'into a {C:attention}random{} suit'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 7
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if next(context.poker_hands["Flush"]) then
                local suit = pseudorandom_element(SMODS.Suits, pseudoseed("pantone_suit"))
                for i = 1, #G.hand.cards do
                    local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                    local v = G.hand.cards[i]
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            v:flip()
                            play_sound("card1", percent)
                            v:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
                delay(0.2)
                for i, v in pairs(G.hand.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.1,
                        func = function()
                            assert(SMODS.change_base(v, suit.key))
                            return true
                        end
                    }))
                end
                for i = 1, #G.hand.cards do
                    local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                    local v = G.hand.cards[i]
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.15,
                        func = function()
                            v:flip()
                            play_sound("tarot2", percent, 0.6)
                            v:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
                return {
                    message = localize(suit.key, "suits_plural") .. "!",
                    colour = G.C.SUITS[suit.key]
                }
            end
        end
    end
}
