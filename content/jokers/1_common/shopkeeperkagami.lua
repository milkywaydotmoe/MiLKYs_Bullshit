SMODS.Joker{ --Shop Keeper Kagami
    key = "shopkeeperkagami",
    config = {
        extra = {
            discount_amount = 20
        }
    },
    loc_txt = {
        ['name'] = 'Shop Keeper Kagami',
        ['text'] = {
            [1] = 'All shop items are {C:attention}#1#%{} off'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discount_amount } }
    end,
    pos = {
        x = 3,
        y = 2
    },
    pronouns = "she_they",
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

    in_pool = function(self, args)
          return (
          not args

          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
    end
}

local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    local skk = SMODS.find_card("j_mktjk_shopkeeperkagami")

    if next(skk) then
        self.cost = math.max(0, math.floor(self.cost * (1 - skk[1].ability.extra.discount_amount / 100))) end
    end
