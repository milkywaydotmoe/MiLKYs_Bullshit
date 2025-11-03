SMODS.Joker{ --Sig
    key = "sig",
    config = {
        extra = {
            sigmult = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'Sig',
        ['text'] = {
            [1] = '{X:red,C:white}#1#X{} Mult if played hand',
            [2] = 'contains a {C:attention}Lucky{} Card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 6
    },
    pronouns = 'he_they',
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
        
        return {vars = {card.ability.extra.sigmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local count = 0
    for _, playing_card in pairs(context.scoring_hand or {}) do
        if SMODS.get_enhancements(playing_card)["m_lucky"] == true then
            count = count + 1
        end
    end
    return count >= 1
end)() then
                return {
                    Xmult = card.ability.extra.sigmult
                }
            end
        end
    end
}