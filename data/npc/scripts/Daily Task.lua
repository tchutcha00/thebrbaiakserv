local function doAddItemsFromList(cid,items)
	if table.maxn(items) > 0 then
		local backpack = doCreateItemEx(10521)
		for i = 1, table.maxn(items) do
			local count = items[i][2]
			while count > 0 do
				if isItemStackable(items[i][1]) then
					doAddContainerItem(backpack, items[i][1], 1)
					doPlayerAddItemEx(cid,backpack)
				else
					doAddContainerItem(backpack, items[i][1],1)
					doPlayerAddItemEx(cid,backpack)
				end
				count = count - 1
			end
		end
	end
end
-----------------
function restTempo(storage)
	local segundos, minutos, horas = 0,0,0
	local tot = storage - os.time()
	horas = math.floor(tot/3600)
	tot = tot - horas * 3600
	minutos = math.floor(tot/60)
	tot = tot - minutos * 60
	segundos = tot
	return string.format("%.2d:%.2d:%.2d", horas, minutos, segundos)
end
------------------
local function getItemsFromList(items)
	local str = ''
	if table.maxn(items) > 0 then
		for i = 1, table.maxn(items) do
			str = str .. items[i][2] .. ' ' .. getItemNameById(items[i][1])
			if i ~= table.maxn(items) then 
				str = str .. ', ' 
			end 
		end 
	end
	return str
end
--------------------
local function getRandomDailyNames()
	local t = {}
	for i, v in pairs(dailytasktabble.tasks) do 
		t[#t + 1] = i
	end 
	return t
end 
--------------------

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	local dailyStorageTime = 221200
	local msg = string.lower(msg)
	if isInArray({"daily task"}, msg) then
		if isPremium(cid) then
		if getPlayerStorageValue(cid, dailyStorageTime) - os.time() <= 0 then
			local tb_daily = getRandomDailyNames()
			local daily = tb_daily[math.random(1, #tb_daily)]
			local contagem = getPlayerStorageValue(cid, dailytasktabble.tasks[daily].storage)
			if not tonumber(contagem) then 
				npcHandler:say('Você já terminou essa task!', cid) 
				return true 
			end
			if (contagem == -1) then contagem = 0 end
			setPlayerStorageValue(cid, dailytasktabble.tasks[daily].storage_start, 1)
			setPlayerStorageValue(cid, dailytasktabble.tasks[daily].storage, 1)
			setPlayerStorageValue(cid, dailyStorageTime, os.time() + 24 * 60 * 60)
			npcHandler:say("Parabéns, agora você está participando da missão task do ".. daily ..", falta matar "..string.sub((contagem)-dailytasktabble.tasks[daily].count, 2)..".", cid)
		else
			npcHandler:say("Você precisa esperar "..restTempo(getPlayerStorageValue(cid,dailyStorageTime)).." para pegar a daily task novamente.", cid)
		end
	else
		npcHandler:say("Você precisa ser VIP para iniciar uma daily task.", cid) 
	end

	elseif isInArray({"report"}, msg) then
		local ckc = false
		for k, v in pairs(dailytasktabble.tasks) do
			if getPlayerStorageValue(cid,dailytasktabble.tasks[k].storage_start) >= 1 then
				local contagem = getPlayerStorageValue(cid, dailytasktabble.tasks[k].storage)
				if (contagem == -1) then contagem = 0 end
				if contagem >= dailytasktabble.tasks[k].count then
					local str = ""
					if dailytasktabble.tasks[k].exp ~= nil then doPlayerAddExp(cid, dailytasktabble.tasks[k].exp ) str = str.."".. (str == "" and "" or ",") .." "..dailytasktabble.tasks[k].exp.." de exp" end
					if dailytasktabble.tasks[k].money ~= nil then doPlayerAddMoney(cid, dailytasktabble.tasks[k].money) str = str.."".. (str == "" and "" or ",") ..""..dailytasktabble.tasks[k].money.." gps" end
					if dailytasktabble.tasks[k].reward ~= nil then doAddItemsFromList(cid,dailytasktabble.tasks[k].reward) str = str.."".. (str == "" and "" or ",") ..""..getItemsFromList(dailytasktabble.tasks[k].reward) end
					setPlayerStorageValue(cid, dailytasktabble.tasks[k].storage, 0)
					setPlayerStorageValue(cid, dailytasktabble.tasks[k].storage_start, -1)
					npcHandler:say("Obrigado pela sua ajuda aqui está a sua recompensa.", cid)
					ckc = true
					break
				else
					npcHandler:say('Já matou: {'..(contagem)..'} '.. k ..' mortos. Você precisa matar: {'..dailytasktabble.tasks[k].count..'} '..k..' para concluir a task.', cid)
					ckc = true
					break
				end
			end
		end
		if not (ckc) then npcHandler:say("Você ainda não começou a daily.", cid) end 
	end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())