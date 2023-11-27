local keywordHandler = KeywordHandler:new()
	local npcHandler = NpcHandler:new(keywordHandler)
	NpcSystem.parseParameters(npcHandler)
	local talkState = {}
    
	function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
	function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
	function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
	function onThink()					npcHandler:onThink()					end


function creatureSayCallback(cid, type, msg)
    local pid = getPlayerGUID(cid)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if msgcontains(msg, 'master reset') then
            doPlayerPopupFYI(cid, "Master Reset\n\n(Sobre o Sistema)\n(+)Reset parcial do personagem\n(+)Chance de resetar level mais alto\n(+)N�o perde quests,task, dodge e nem critical\n(+)N�o perde skills.\n\n                                                      (ATEN��O!)\n\nO Master Reset volta o seu personagem ao level 30, reset 0, life e mana inicial!!")
            selfSay('Tendo em vista todas as informa��es apresentadas, voc� realmente deseja dar um Master Reset? Esse processo tem um custo de 100 vip coins e � irrevers�vel! Diga {yes} para confirmar.', cid)
            talkState[talkUser] = 1
    elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
	if doPlayerRemoveItem(cid, 6527,100) then
            --Tira toda a vida e soma + 185
            doCreatureAddHealth(cid, -getCreatureHealth(cid)+185)
            setCreatureMaxHealth(cid,185)
            --Tira toda a mana e soma + 35
            doCreatureAddMana(cid, -getCreatureMana(cid)+35)
            setCreatureMaxMana(cid,35)
            doTeleportThing(cid, getTownTemplePosition(1))
            doRemoveCreature(cid)
            local reset_level = "UPDATE players SET level = 30 WHERE id= " ..pid.. ";"
            local reset_query = "UPDATE players SET reset = 0 WHERE id= " ..pid.. ";"
			local reset_exp = "UPDATE players SET experience = 4200 WHERE id= " ..pid.. ";"
            db.executeQuery(reset_exp)
            db.executeQuery(reset_query)
            db.executeQuery(reset_level)
        else
            selfSay("Voc� n�o possui 100 event tokens", cid)
    end

    talkState[talkUser] = 0
end 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())