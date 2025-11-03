SMODS.Joker{ --Obligatory Triangle Joker
    key = "obligatorytrianglejoker",
    config = {
        extra = {
            triangle = 33
        }
    },
    loc_txt = {
        ['name'] = 'Obligatory Triangle Joker',
        ['text'] = {
            '{C:blue}+#1#{} Chips if hand contains',
            'a {C:attention}Three of #2#s{}',
            '{C:inactive}(Suit changes every round){}'
        },
        ['unlock'] = {
            'Play a 3 of a Kind'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    soul_pos = {
        x = 5,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    pronouns = "she_they",
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',
    pools = { ["milkys_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.triangle, localize((G.GAME.current_round.suit_kind_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.suit_kind_card or {}).suit or 'Spades']}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.suit_kind_card = { suit = 'Spades' }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if G.playing_cards then
                local suits = {}
                for k, v in pairs(SMODS.Suits) do
                    for i, w in ipairs(G.playing_cards) do
                    if w.base.suit == k then suits[#suits + 1] = k end
                    end
                end
                G.GAME.current_round.suit_kind_card.suit = pseudorandom_element(suits, pseudoseed('suit_kind' .. G.GAME.round_resets.ante))
            end
        end

        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 3 and context.other_card:is_suit(G.GAME.current_round.suit_kind_card.suit)) then
                return {
                    chips = card.ability.extra.triangle,
                    message = "triangle time :3"
                }
            end
        end
    end
}