SMODS.Joker({ --DJ Deck
	key = "djdeck",
	config = {
		extra = {
			mult = 5,
		},
	},
	loc_txt = {
		["name"] = "DJ Deck",
		["text"] = {
			[1] = "{C:mult}+#1#{} Mult per unique",
			[2] = "soundtrack played",
			[3] = "this run",
			[4] = "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
		},
		["unlock"] = {
			[1] = "Unlocked by default.",
		},
	},
	pos = {
		x = 0,
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
	loc_vars = function(self, info_queue, card)
		local count = 0
		if G.GAME and G.GAME.mktjk_soundtracks_played then
			for _, _ in pairs(G.GAME.mktjk_soundtracks_played) do
				count = count + 1
			end
		end
		return { vars = { card.ability.extra.mult, card.ability.extra.mult * count } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			local count = 0
			if G.GAME and G.GAME.mktjk_soundtracks_played then
				for _, _ in pairs(G.GAME.mktjk_soundtracks_played) do
					count = count + 1
				end
			end
			return {
				mult = count * card.ability.extra.mult,
			}
		end
	end,
})

local start_run_hook = Game.start_run
function Game:start_run(args)
	start_run_hook(self, args)
	G.GAME.mktjk_soundtracks_played = G.GAME.mktjk_soundtracks_played or {}
end