SMODS.Joker({ --DJ Mixer
	key = "djmixer",
	config = {
		extra = {mult = 20, xmult = 2},
	},
	loc_txt = {
		["name"] = "DJ Mixer",
		["text"] = {
			[1] = "{C:red}+#1#{} Mult",
			[2] = "{X:red,C:white}X#2#{} Mult",
			[3] = "when surrounded by",
			[4] = "{C:attention}2 DJ Deck{} Jokers",
		},
		["unlock"] = {
			[1] = "Unlocked by default.",
		},
	},
	pos = {
		x = 1,
		y = 8,
	},
	pronouns = "it_its",
	cost = 5,
	rarity = 2,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	unlocked = true,
	discovered = false,
	atlas = "jokers",
	pools = {
		["milkys_jokers"] = true,
	},
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.xmult}}
    end,

	calculate = function(self, card, context)
		if context.joker_main then
			local index = 0
			for i, joker in ipairs(G.jokers.cards) do
				if joker == card then
					index = i
				end
			end
            local ret = {mult = card.ability.extra.mult}
			if
				G.jokers.cards[index - 1]
				and G.jokers.cards[index - 1].config.center.key == "j_mktjk_djdeck"
				and G.jokers.cards[index + 1]
				and G.jokers.cards[index + 1].config.center.key == "j_mktjk_djdeck"
			then
                ret["xmult"] = card.ability.extra.xmult
			end
            return ret
		end
	end,
})
