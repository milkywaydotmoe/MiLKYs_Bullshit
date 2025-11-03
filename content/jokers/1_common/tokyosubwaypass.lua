SMODS.Joker{ --Tokyo Subway Pass
    key = "tokyosubwaypass",
    config = {
        extra = {
            before_expiry = 5,
            multvar = 3
        }
    },
    loc_txt = {
        ['name'] = 'Tokyo Subway Pass',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X#2#{} Mult if hand',
            [2] = 'contains a {C:attention}Full House{}',
            [3] = '{C:inactive}(Expires in #1# round/s.){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    pronouns = "it_its",
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.before_expiry, card.ability.extra.multvar}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Full House"]) then
                return {
                    Xmult = card.ability.extra.multvar
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (card.ability.extra.before_expiry or 0) <= 0 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "申し訳ございません。パスが期限切れになりました。新しいパスをお買いくださいませ。"
                }
            else
                return {
                    func = function()
                    card.ability.extra.before_expiry = math.max(0, (card.ability.extra.before_expiry) - 1)
                    return true
                end
                }
            end
        end
    end
}
