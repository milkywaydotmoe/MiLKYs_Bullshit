SMODS.Joker{ --Melody Nosurname
    key = "melodynosurname",
    config = {
        extra = {
            xchips = 2,
            handsize = 5
        }
    },
    loc_txt = {
        ['name'] = 'Melody Nosurname',
        ['text'] = {
            [1] = 'Gives {X:blue,C:white}#1#X{} Chips when',
            [2] = 'no {C:attention}face cards{} are played',
            [3] = 'in a {C:attention}#2# card hand{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips, card.ability.extra.handsize}}
    end,
    pos = {
        x = 6,
        y = 4
    },
    pronouns = "she_they",
    cost = 8,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local rankFound = true
    for i, c in ipairs(context.full_hand) do
        if c:is_face() then
            rankFound = false
            break
        end
    end
    
    return rankFound
end)() and #context.full_hand == card.ability.extra.handsize) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}