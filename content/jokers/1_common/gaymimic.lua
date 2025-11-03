SMODS.Joker{ --Game Theory: Mimic Learns About Homosexuality.
    key = "gaymimic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Game Theory: Mimic Learns About Homosexuality.',
        ['text'] = {
            [1] = 'If there are at least',
            [2] = '2 {C:attention}Jacks{} or {C:attention}Kings{}',
            [3] = 'in played hand, give',
            [4] = '{X:blue,C:white}X1.2{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 6
    },
    pronouns = 'he_him',
    cost = 5,
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

    loc_vars = function (self, queue)
        queue[#queue+1] = {key = 'mktjk_credit_candycane', set = 'Other'}
    end,

    set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Immutable', G.C.ORANGE, G.C.WHITE, 1 )
 	end,

    calculate = function(self, card, context)
            -- give xmult 
            if context.joker_main then
                local jCount = 0
                local kCount = 0

                for _, card in ipairs(context.scoring_hand) do
                    if card:get_id() == 11 then --counting jacks
                        jCount = jCount + 1
                    end
                    if card:get_id() == 13 then -- counting queens
                        kCount = kCount + 1
                    end
                end

                if jCount >= 2 or kCount >= 2 then
                return {
                    xmult = 1.2
                }
            end
        end 
    end
}