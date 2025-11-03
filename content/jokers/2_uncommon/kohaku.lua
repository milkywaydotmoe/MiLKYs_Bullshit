SMODS.Joker{ --コハク
    key = "kohaku",
    config = {
        extra = {
            multinum = 0.25
        }
    },
    loc_vars = function(self, queue, card) 
        queue[#queue+1] = {key = 'mktjk_kohaku_name', set = 'Other'}
        local count = 0
        if G.playing_cards then
            for _, _card in ipairs(G.playing_cards) do 
                if not SMODS.has_no_rank(_card) and _card:get_id() == 9 then -- stone card has a random id already but just in case
                    count = count + 1
                end
            end
        end
        return {
            vars = {
                card.ability.extra.multinum,
                (card.ability.extra.multinum * count) + 1
            }
        } end,
    loc_txt = {
        ['name'] = '{f:5}コハク',
        ['text'] = {
            '{C:white,X:mult}X#1#{} Mult for each',
            '{C:attention}9{} in full deck',
            '{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)'
        }
    },
    pronouns = "she_her",
    pos = {
        x = 4,
        y = 1,
    },
    cost = 7,
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
            local count = 0
            for _, _card in ipairs(G.playing_cards) do 
                if not SMODS.has_no_rank(_card) and _card:get_id() == 9 then -- stone card has a random id already but just in case
                    count = count + 1
                end
            end
            return {
                Xmult = (card.ability.extra.multinum * count) + 1
            }
        end
    end
}
