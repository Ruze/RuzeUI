local C = {}

C["general"] = {
	["backdropcolor"] = { .05,.05,.05 },                   -- default backdrop color of panels
	["bordercolor"] = { .2,.2,.2 },                     -- default border color of panels
}

C["unitframes"] = {
	["playerbuffs"] = true,                             -- enable buffs on player unit frame
}

C["actionbar"] = {
	["buttonsize"] = 32,                                -- normal buttons size
}

C["classtimer"] = {
	["enable"] = true,											-- enable classtimer
	["targetdebuffs"] = false,									-- target debuffs above target (looks crappy imo)
	["playercolor"] = {.2, .2, .2, 1 },							-- playerbarcolor
	["targetbuffcolor"] = { 70/255, 150/255, 70/255, 1 },		-- targetbarcolor (buff)
	["targetdebuffcolor"] = { 150/255, 30/255, 30/255, 1 },		-- targetbarcolor (debuff)
	["trinketcolor"] = {75/255, 75/255, 75/255, 1 },			-- trinketbarcolor
	["spark"] = false,
	["barheight"] = 18,
	["icon"] = true,
	["time"] = true,
	["name"] = false,
} 

C["filger"] = {
	["enable"] = false,
	["filgerconfig"] = false,
	["iconsize"] = 32,
	["proccs"] = "RIGHT",
	["buffs"] = "RIGHT",
	["debuffs"] = "RIGHT",
	["cd"] = "RIGHT",
	["pet"] = "RIGHT",
}

C["datatext"] = {
	["fps_ms"] = 7,                                     -- show fps and ms on panels
	["system"] = 0,                                     -- show total memory and others systems infos on panels
	["bags"] = 0,                                       -- show space used in bags on panels
	["gold"] = 0,                                       -- show your current gold on panels
	["wowtime"] = 8,                                    -- show time on panels
	["guild"] = 0,                                      -- show number on guildmate connected on panels
	["dur"] = 0,                                        -- show your equipment durability on panels.
	["friends"] = 0,                                    -- show number of friends connected.
	["dps_text"] = 0,                                   -- show a dps meter on panels
	["hps_text"] = 0,                                   -- show a heal meter on panels
	["power"] = 0,                                      -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["haste"] = 0,                                      -- show your haste rating on panels.
	["crit"] = 0,                                       -- show your crit rating on panels.
	["avd"] = 0,                                        -- show your current avoidance against the level of the mob your targeting
	["armor"] = 0,                                      -- show your armor value against the level mob you are currently targeting
	["currency"] = 0,                                   -- show your tracked currency on panels
	["hit"] = 0,                                        -- show hit rating
	["mastery"] = 0,                                    -- show mastery rating
	["micromenu"] = 0,                                  -- add a micro menu thought datatext
	["regen"] = 0,                                      -- show mana regeneration
	["talent"] = 0,                                     -- show talent
	["calltoarms"] = 0,                                 -- show dungeon and call to arms
}

C["skin"] = {
	["recount"] = true,
}

TukuiEditedDefaultConfig = C