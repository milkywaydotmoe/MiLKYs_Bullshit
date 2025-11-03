SMODS.Shader {
  key = "dithered",
  path = "dithered.fs"
}

SMODS.Edition {
  key = "dithered",
  shader = "dithered",
  discovered = false,
  in_shop = true,
  weight = 4,
  extra_cost = 7,

  sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },

  calculate = function(self, card, context)
    if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
      local new_chips = 2 ^ (math.ceil(math.log(hand_chips) / math.log(2)))
      local new_mult = 2 ^ (math.ceil(math.log(mult) / math.log(2)))
      return {
        chips = new_chips - hand_chips > 0 and new_chips - hand_chips or nil,
        mult = new_mult - mult > 0 and new_mult - mult or nil
      }
    end
  end
}
