SMODS.Joker{ --Azazal
    key = "azazal",
    config = {
        extra = {
            meowstep = 1
        }
    },
    loc_txt = {
        ['name'] = 'Azazal',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult for every day since {C:attention}Meow Or Never{} was released.',
            [2] = '{C:inactive}(Currently {}{X:red,C:white}X#2#{}{C:inactive} Mult){}',
            [3] = '{C:spectral, s:0.5}HOLY FUCK AZAZAL IS BACKKK LETS FUCKING GOOOOO!!!!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    soul_pos = {
        x = 8,
        y = 5
    },
    pronouns = "she_her",
    cost = 39,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

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
                card.ability.extra.meowstep, 
                (card.ability.extra.meowstep * SinceDay(2025, 9, 15)) 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = (card.ability.extra.meowstep * SinceDay(2025, 9, 15))
                }
        end
    end
}
