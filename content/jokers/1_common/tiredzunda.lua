function check_mktjk_site()
    local host = "milkyway.moe"
    local cmd

    -- Detect OS: Windows uses `-n`, Unix uses `-c`
    if package.config:sub(1,1) == "\\" then
        cmd = 'ping -n 1 ' .. host .. ' > NUL'
    else
        cmd = 'ping -c 1 ' .. host .. ' >/dev/null 2>&1'
    end

    local result = os.execute(cmd)

    if result == true or result == 0 then
        mktjk_sitestatus = 1
        mktjk_sitestatus_word = "up"
    else
        mktjk_sitestatus = 0
        mktjk_sitestatus_word = "down"
    end
end

-- Run once
check_mktjk_site()
print("mktjk_sitestatus = " .. tostring(mktjk_sitestatus))

-- G.E_MANAGER:add_event(Event({
--     func = function()
--         local host = "milkyway.moe"
--         local cmd

--         -- Detect OS: Windows uses `-n`, Unix uses `-c`
--         if package.config:sub(1,1) == "\\" then
--             cmd = 'ping -n 1 ' .. host .. ' > NUL'
--         else
--             cmd = 'ping -c 1 ' .. host .. ' >/dev/null 2>&1'
--         end

--         local result = os.execute(cmd)

--         if result == true or result == 0 then
--             mktjk_sitestatus = 1
--             mktjk_sitestatus_word = "up"
--         else
--             mktjk_sitestatus = 0
--             mktjk_sitestatus_word = "down"
--         end
--         return true
--     end
-- }))

SMODS.Joker{ --Tired Zunda from Milkys Website
    key = "tiredzunda",
    config = {
        extra = {
            sitestatus = _G.mktjk_sitestatus,
            sitestatusword = _G.mktjk_sitestatus_word,
            modifyingvar = 10
        }
    },
    loc_txt = {
        ['name'] = 'Tired Zunda from Milkys Website',
        ['text'] = {
            [1] = '{C:red}+#2#{} Mult when milkyway.moe is online',
            [2] = '{X:red,C:white}X#2#{} Mult when the site is down.',
            [3] = '{C:inactive}(The site is currently #3#){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = {
        ["milkys_jokers"] = true
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.sitestatus, card.ability.extra.modifyingvar, card.ability.extra.sitestatusword}}
    end,

    update = function (self, card, dt)
        card.ability.extra.sitestatus = mktjk_sitestatus
        card.ability.extra.sitestatusword = mktjk_sitestatus_word
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            check_mktjk_site()
        end

        if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    check_mktjk_site()
                    return true
                end
            }))
        end

        if context.starting_shop and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    check_mktjk_site()
                    return true
                end
            }))
        end

        if context.joker_main then
            if (card.ability.extra.sitestatus or 0) == 1 then
                return {
                    mult = card.ability.extra.modifyingvar,
                    message = "Site Online!"
                }
            elseif (card.ability.extra.sitestatus or 0) == 0 then
                return {
                    xmult = card.ability.extra.modifyingvar,
                    message = "404 NOT FOUND"
                }
            end
        end
    end
}

-- thunderedge pls fix
