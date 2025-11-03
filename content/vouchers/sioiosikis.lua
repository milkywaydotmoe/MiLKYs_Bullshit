SMODS.Voucher { -- Should I Open It or Should I Keep It Sealed
    key = 'sioiosikis',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            slots = 3
        }
    },
    loc_txt = {
        ['name'] = 'Should I Open It or Should I Keep It Sealed',
        ['text'] = {
            '{C:dark_edition}+#1#{} Joker slots'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    atlas = 'vouchers',
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.slots
            } 
        }
    end,

    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
                return true
            end
        }))
    end
}