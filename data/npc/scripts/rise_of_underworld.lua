local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local reward1 = {
[1] = {2157,50},
[2] = {6542,2},
[3] = {6543,2},
[4] = {10142,2},
[5] = {6545, 2},
[6] = {2328, 2}
}
local reward2 = {
[1] = {2157,50},
[2] = {6542,2},
[3] = {6543,2},
[4] = {10142,2},
[5] = {6545, 2},
[6] = {2328, 2}
}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "hi") and (not npcHandler:isFocused(cid)) then
		if getPlayerStorageValue(cid, 45461) - os.time() > 0 and getPlayerStorageValue(cid, 45462) - os.time() > 0 then -- Last HIT
			if getPlayerStorageValue(cid, 45465) - os.time() <= 0 then
				local parcel, time = doCreateItemEx(2595), os.time()
				local label, target = doAddContainerItem(parcel, 2599), getCreatureName(cid)

				doItemSetAttribute(label, "text", target .. "\nKing-Baiak")
				doItemSetAttribute(label, "date", time)
				doItemSetAttribute(label, "writer", getCreatureName(getNpcId()))
				
				for _, item in ipairs(reward1) do
					if(item == 1) then
						local tmp = doCreateItemEx(item[1])

						doItemSetAttribute(tmp, "text", item[2])
						doItemSetAttribute(tmp, "date", time)
						doItemSetAttribute(tmp, "writer", getCreatureName(getNpcId()))

						doAddContainerItemEx(parcel, tmp)
					else
						doAddContainerItem(parcel, item[1], item[2] or 1)
					end
				end

				if getPlayerFreeCap(cid) > 10.00 then
					local trofeu = doPlayerAddItem(cid, 7371, 1)
					doItemSetAttribute(trofeu, "description", "Concedido a ".. getCreatureName(cid) .." por ter sido o lastHit no boss Ascending Ferumbras em ".. (os.date("%d/%m/%Y", os.time())) ..".")
					doPlayerSendMailByName(target, parcel, 1) -- TOWN 1 = YUROTS
					doPlayerAddExp(cid, 150000)
					doPlayerSetBalance(cid, getPlayerBalance(cid) + 250000)
					setPlayerStorageValue(cid, 45465, os.time()+15*60)
					doPlayerPopupFYI(cid, "                       [+] World Boss [+]\n        # Evento Exclusivo do Servidor #\n\nVocê deu o último dano no World Boss.\n\n\n                       .:: RECOMPENSA ::.\n\nEXP: +150k\nGOLD: +250k (enviado para o banco)\n\n+100 VIP Coins\n+2 [+200%] EXP Potion.\n+2 [+300%] EXP Potion.\n+2 [+400%] EXP Potion.\n+2 [+500%] EXP Potion.\n+2 [+600%] EXP Potion.\n\nTodos os items foram enviados por parcel.\nVá até seu Depot pegar a sua recompensa.")
				else
					doPlayerPopupFYI(cid, "                                                [+] World Boss [+]\n                                  #Evento Exclusivo do Servidor#\n\nVocê precisa ter mais que '10.00 oz' (cap) para receber o troféu.\nVocê não recebeu o prêmio. Volte assim que tiver mais que '10.00 oz'.\n\nLembre-se: Você só tem alguns minutos para receber a recompensa.")
				end
			else
				doPlayerPopupFYI(cid, "                                 [+] World Boss [+]\n                   #Evento Exclusivo do Servidor#\n\nVocê já recebeu sua recompensa. Vá até seu DEPOT.\nOs prêmios foram enviados por PARCEL.")
			end
			
		elseif getPlayerStorageValue(cid, 45462) - os.time() > 0 then -- TOP 10 dano
			if getPlayerStorageValue(cid, 45465) - os.time() <= 0 then
				local parcel, time = doCreateItemEx(2595), os.time()
				local label, target = doAddContainerItem(parcel, 2599), getCreatureName(cid)

				doItemSetAttribute(label, "text", target .. "\nKing-Baiak")
				doItemSetAttribute(label, "date", time)
				doItemSetAttribute(label, "writer", getCreatureName(getNpcId()))

				for _, item in ipairs(reward2) do
					if(item == 1) then
						local tmp = doCreateItemEx(item[1])

						doItemSetAttribute(tmp, "text", item[2])
						doItemSetAttribute(tmp, "date", time)
						doItemSetAttribute(tmp, "writer", getCreatureName(getNpcId()))

						doAddContainerItemEx(parcel, tmp)
					else
						doAddContainerItem(parcel, item[1], item[2] or 1)
					end
				end

				doPlayerSendMailByName(target, parcel, 1) -- TOWN 1 = YUROTS
				doPlayerAddExp(cid, 100000)
				doPlayerSetBalance(cid, getPlayerBalance(cid) + 150000)
				setPlayerStorageValue(cid, 45465, os.time()+15*60)
				doPlayerPopupFYI(cid, "                             [+] World Boss [+]\n             # Evento Exclusivo do Servidor #\n\nVocê recebeu uma recompensa no World Boss.\n\n\n                             .:: RECOMPENSA ::.\n\nEXP: +100k\nGOLD: +150k (enviado para o banco)\n\n+5 Event Coins\n+10 Rusty Gear\n+2 Underworld Package\n\nTodos os items foram enviados por parcel.\nVá até seu Depot pegar a sua recompensa.")
			else
				doPlayerPopupFYI(cid, "                                 [+] World Boss [+]\n                   #Evento Exclusivo do Servidor#\n\nVocê já recebeu sua recompensa. Vá até seu DEPOT.\nOs prêmios foram enviados por PARCEL.")
			end
		else
			doPlayerPopupFYI(cid, "                                                               [+] World Boss [+]\n                                               #Evento Exclusivo do Servidor#\n\nVocê precisa ajudar a matar o BOSS para receber a recompensa.\n\nNão fique chateado! Haverá muitas outras chances de enfrentar os World Bosses.\nContinue jogando nosso servidor, seja o mais forte. Continue upando para ...\n... ultrapassar seus limites e vencer seus inimigos, mas com moderação.\n                                                                                                                                            'Ft. Goku'.")
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)