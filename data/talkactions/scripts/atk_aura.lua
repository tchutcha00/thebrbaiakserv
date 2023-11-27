local cfg = {
	needed_storage = 14523, -- storage necessaria pra usar
	damage_percent = 1000, -- porcentagem de dano aumentado

	anim_text = {"'.    ,", ".    ',", ".'    ,"}, -- textos random
	text_color = 210, -- cor do texto
	interval = 1000 -- intervalo entre os efeitos de texto
}

local activeAura = {}
local function startAnimCycle(cid, serial)
	if (isCreature(cid)) then
		if (activeAura[cid] == serial) then
			doSendAnimatedText(getThingPosition(cid), cfg.anim_text[math.random(#cfg.anim_text)], cfg.text_color)
			addEvent(startAnimCycle, cfg.interval, cid, serial)
		end
	else
		activeAura[cid] = nil
	end
end

local cooldownHandler = {}
local cooldownTime = 2 -- segundos de cooldown pra evitar spam
function onSay(cid, words, param, channel)
	local guid = getPlayerGUID(cid)
	if (cooldownHandler[guid] and cooldownHandler[guid] > os.time()) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Espere um pouco.")
		doSendMagicEffect(getThingPosition(cid), CONST_ME_POFF)
		return true
	end

	cooldownHandler[guid] = os.time() + cooldownTime
	if (not activeAura[cid]) then
		if (getCreatureStorage(cid, cfg.needed_storage) == -1) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Você precisa fazer a XXX quest primeiro.")
			doSendMagicEffect(getThingPosition(cid), CONST_ME_POFF)
			return true
		end

		local serial = ""
		for _ = 1, 14 do
			serial = serial .. string.char(math.random(65, 122))
		end

		activeAura[cid] = serial
		startAnimCycle(cid, serial)
		setPlayerDamageMultiplier(cid, getPlayerDamageMultiplier(cid) + (cfg.damage_percent / 100.0))
		doCreatureSay(cid, "Gran Aura", TALKTYPE_MONSTER_SAY)
	else
		activeAura[cid] = nil
		setPlayerDamageMultiplier(cid, getPlayerDamageMultiplier(cid) - (cfg.damage_percent / 100.0))
		doCreatureSay(cid, "Off", TALKTYPE_MONSTER_SAY)
	end
	return true
end
