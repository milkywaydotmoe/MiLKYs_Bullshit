SMODS.Joker{ --Affinity By Canva
    key = "affinitybycanva",
    config = {
        extra = {
            affinity = 1
        }
    },
    loc_txt = {
        ['name'] = 'Affinity By Canva',
        ['text'] = {
            '{C:red}+#1#{} Mult for every day that',
            '{C:attention}Affinity by Canva{} has been released',
            'without paywalling existing features',
            '{C:inactive}(Currently {}{C:red}+#2#{}{C:inactive} Mult){}',
            '{s:0.7}"Free as in freedom my ass." - MiLKY, 2025{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 7
    },
    pronouns = "it_its",
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

    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,


    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.affinity, 
                (card.ability.extra.affinity * SinceDay(2025, 10, 30)) 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = (card.ability.extra.affinity * SinceDay(2025, 10, 30))
                }
        end
    end
}