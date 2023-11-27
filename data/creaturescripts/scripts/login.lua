local male = {lookType = 128, lookHead = 20, lookBody = 132, lookLegs = 76, lookFeet = 132}
local female = {lookType = 128, lookHead = 20, lookBody = 132, lookLegs = 76, lookFeet = 132}

local config = {
  loginMessage = getConfigValue('loginMessage'),
  useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

local blk_vc = {
	[{4}] = 8,
	[{3}] = 7,
	[{2}] = 6,
	[{1}] = 5,
}

local function sendVipMessage(cid)
	if isPlayer(cid) then
		doSendAnimatedText(getPlayerPosition(cid), "[VIP]", 180)
        doSendMagicEffect(getPlayerPosition(cid), 29)
		addEvent(sendVipMessage,4000,cid)
	end
end

local function silence(cid,time,help,sto)
	local storage = 722516
	setConditionParam(muted,CONDITION_PARAM_TICKS,(time*1000))
	if help then
		storage = 722517
		setConditionParam(muted, CONDITION_PARAM_SUBID, 4)
	end
	doAddCondition(cid,muted)
	if sto then
		doPlayerSetStorageValue(cid,storage,os.time()+time)
	end
end 


function onLogin(cid)

  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, '[HYPER-BAIAK]: Bem-vindo ao HYPER aproveite nossos sistemas, participe de muitas wars, quests e aventuras!')
  if isPremium(cid) then
  doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_RED,"[VIP] Você vai receber 20% a mais de experiência por ser VIP.")
  if getPlayerAccess(cid) < 3 then
    addEvent(sendVipMessage,1000,cid)
  end
else
  doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_RED,"[VIP]: Torne-se VIP e ganhe 20% a mais de experiência.")
end

  if(getBooleanFromString(getConfigValue('accountManager')) == false) then
    if (getCreatureName(cid) == "Account Manager") then
      return doRemoveCreature(cid, true)
    end
  end

  if getPlayerStorageValue(cid, 9867) < 0 then
    setPlayerStorageValue(cid, 9867, 1)
    doCreatureChangeOutfit(cid, getPlayerSex(cid) > 0 and female or male)
  end

  local loss = getConfigValue('deathLostPercent')
  if(loss ~= nil and getPlayerStorageValue(cid, "bless") ~= 8) then
    doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
  end

  if(getPlayerStorageValue(cid, "death_bless") == 1) then
    local t = {PLAYERLOSS_EXPERIENCE, PLAYERLOSS_SKILLS, PLAYERLOSS_ITEMS, PLAYERLOSS_CONTAINERS}
    for i = 1, #t do
      doPlayerSetLossPercent(cid, t[i], 100)
    end
    setPlayerStorageValue(cid, "death_bless", 0)
  end

 -- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você possui:")
 -- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '> Level: ['..getPlayerLevel(cid)..'] | Resets: ['..getPlayerResets(cid)..'] | Dodge: ['..math.max(0,(tonumber(getCreatureStorage(cid,92798645)) or 0))..'/500] | Critical: ['..math.max(0,(tonumber(getCreatureStorage(cid,42904)) or 0))..'/500].')
 -- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "> Kills: "..getDeathsAndKills(cid,"kill").." / Deaths: "..getDeathsAndKills(cid,"death").."")
 -- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Dúvidas Use: !info ou o Channel Help.")

  doPlayerOpenChannel(cid, 9)
  doPlayerOpenChannel(cid,10)

  local accountManager = getPlayerAccountManager(cid)
  if(accountManager == MANAGER_NONE) then
    local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
    if(lastLogin > 0) then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
      str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
    else
      str = str .. " Please choose your outfit."
      doPlayerSendOutfitWindow(cid)
    end

    doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
  elseif(accountManager == MANAGER_NAMELOCK) then
    addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
  elseif(accountManager == MANAGER_ACCOUNT) then
    addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
  else
    addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
  end

  if(not isPlayerGhost(cid)) then
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
  end

  checkWarSquares(cid)

  registerCreatureEvent(cid, "Idle")
  registerCreatureEvent(cid, "Mail")
  if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
    registerCreatureEvent(cid, "ExtendedOpcode")
  end

  registerCreatureEvent(cid, "ReportBug")
  if(config.useFragHandler) then
    registerCreatureEvent(cid, "SkullCheck")
  end
  
  	if getPlayerStorageValue(cid,722422) > 0 then
		if getPlayerAccess(cid) < 4 then
			startAura(cid)
		end
	end

	if getCreatureStorage(cid, 722641) > 0 and getPlayerAccess(cid) < 4 then
		startSpiritualAura(cid)
	end
  
  	local help_muted_time = getPlayerStorageValue(cid,722517)
	if help_muted_time > os.time() then
		silence(cid,help_muted_time - os.time(), true, false)
	end
	local muted_time = getPlayerStorageValue(cid,722516)
	if muted_time > os.time() then
		silence(cid,muted_time - os.time(),false,false)
	end

	local guildId = getPlayerGuildId(cid)
	if guildId ~= 0 and guildId == Castle48h.dominant then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[HYPER-CASTLE]: A sua Guild domina o Castle48H, por isso o seu time recebe 50% a mais de EXP!')
	else
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[HYPER-CASTLE]: A Guild que dominar o Castle48H recebe 50% a mais de EXP!')
	end
	

	if (getPlayerStorageValue(cid, 48009) > os.time()) then 
		return false
	end 

	for bl, v in pairs(blk_vc) do 
		if (isInArray(bl, getPlayerVocation(cid))) then 
			doPlayerSetVocation(cid, v)
			doPlayerSave(cid)
		end 
	end 


  registerCreatureEvent(cid, "blesscheck")
  registerCreatureEvent(cid, "blesscheck1")
  registerCreatureEvent(cid, "GuildEvents")
  registerCreatureEvent(cid, "AdvanceSave")
  registerCreatureEvent(cid, "promotion")
  registerCreatureEvent(cid, "IOE")
  registerCreatureEvent(cid, "HuntLeave")
  registerCreatureEvent(cid, "CombatDodge")
  registerCreatureEvent(cid, "critical")
  registerCreatureEvent(cid, "SystemTask")
  registerCreatureEvent(cid, "DailyTask")
  registerCreatureEvent(cid, "DeathSystem")
  registerCreatureEvent(cid, "Lever")
  registerCreatureEvent(cid, "areaMining")
  registerCreatureEvent(cid, "redSkullAmulet")
  registerCreatureEvent(cid, "Vip Gratis")
  registerCreatureEvent(cid, "showKD")
  registerCreatureEvent(cid, "AttackPK")
  registerCreatureEvent(cid, "FireStorm")
  registerCreatureEvent(cid, "checkBless")
  registerCreatureEvent(cid, "TopFrags")
  registerCreatureEvent(cid, "PartyDamage")
  registerCreatureEvent(cid, "TargetNpc")
  registerCreatureEvent(cid, "MonsterDropLoot")
  registerCreatureEvent(cid, "pushPzHenrique")
  registerCreatureEvent(cid, "Points_Trade")
  registerCreatureEvent(cid, "DeathCounter")
  registerCreatureEvent(cid, "KillCounter")
  registerCreatureEvent(cid, "legendaryLeverLook")
  registerCreatureEvent(cid, "Claptomaniaco")
  registerCreatureEvent(cid, "cast-logout")
  return true
end
