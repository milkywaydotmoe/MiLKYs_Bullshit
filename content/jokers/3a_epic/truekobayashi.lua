SMODS.Joker{ --True Kobayashi
    key = "truekobayashi",
    config = {
        extra = {
            save_reroll_cost = 5
        }
    },
    loc_txt = {
        ['name'] = 'True Kobayashi',
        ['text'] = {
            [1] = '{C:attention}Everything{} in shop is {C:green}free',
            [2] = '{C:green}Rerolls{} start at {C:money}$0'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    pronouns = "she_her",
    cost = 20,
    rarity = 'mktjk_epic',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
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

    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,

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
        card.ability.extra.save_reroll_cost = G.GAME.round_resets.reroll_cost
        G.GAME.round_resets.reroll_cost = 0
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
        G.GAME.round_resets.reroll_cost = card.ability.extra.save_reroll_cost
    end
} 
      
local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_mktjk_truekobayashi")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then
            self.cost = 0
        end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end
