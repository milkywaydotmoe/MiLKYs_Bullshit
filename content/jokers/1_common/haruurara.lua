SMODS.Joker{ --Haru Urara
    key = "haruurara",
    config = {
        extra = {
            odds = 1000,
            Xmult = 113,
            chips = 113
        }
    },
    loc_txt = {
        ['name'] = '{f:5}ハルウララ',
        ['text'] = {
            '{C:chips}+113{} Chips',
            '{s:0.8,C:dark_edition}Rest in peace, our shining star.{}',
            '{s:0.6,C:inactive}2/27/1996 - 9/9/2025{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    loc_vars = function (self, queue, card)
        queue[#queue+1] = {key = 'mktjk_haruurara_name', set = 'Other'}
    end,
    pos = {
        x = 5,
        y = 2
    },
    pronouns = "she_her",
    cost = 1,
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

    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if SMODS.pseudorandom_probability(card, 'group_0_4a6324d9', 1, card.ability.extra.odds, 'j_mktjk_haruurara') then
                SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
            else
                return {
                    chips = card.ability.extra.chips,
                    message = "Umapyoi!"
                }
            end
        end
    end
}