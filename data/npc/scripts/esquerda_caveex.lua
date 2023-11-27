local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(EAST)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(EAST)	         		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'empty potion flask'}, 7636, 100, 'empty potion flask')
shopModule:addBuyableItem({'avalanche rune'}, 2274, 45, 'avalanche rune')
shopModule:addBuyableItem({'animate dead rune'}, 2316, 375, 'animate dead rune')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 'blank rune')
shopModule:addBuyableItem({'chameleon rune'}, 2291, 210, 'chameleon rune')
shopModule:addBuyableItem({'convince creature rune'}, 2290, 80, 'convince creature rune')
shopModule:addBuyableItem({'cure poison rune'}, 2266, 65, 'cure poison rune')
shopModule:addBuyableItem({'destroy field rune'}, 2261, 15, 'destroy field rune')
shopModule:addBuyableItem({'disintegrate rune'}, 2310, 26, 'disintegrate rune')
shopModule:addBuyableItem({'energy bomb rune'}, 2262, 162, 'energy bomb rune')
shopModule:addBuyableItem({'energy field rune'}, 2277, 38, 'energy field rune')
shopModule:addBuyableItem({'energy wall rune'}, 2279, 85, 'energy wall rune')
shopModule:addBuyableItem({'explosion rune'}, 2313, 31, 'explosion rune')
shopModule:addBuyableItem({'fireball rune'}, 2302, 30, 'fireball rune')
shopModule:addBuyableItem({'fire bomb rune'}, 2305, 117, 'fire bomb rune')
shopModule:addBuyableItem({'fire field rune'}, 2301, 28, 'fire field rune')
shopModule:addBuyableItem({'fire wall rune'}, 2303, 61, 'fire wall rune')
shopModule:addBuyableItem({'great fireball rune'}, 2304, 45, 'great fireball rune')
shopModule:addBuyableItem({'great health potion'}, 7591, 190, 'great health potion')
shopModule:addBuyableItem({'great mana potion'}, 7590, 120, 'great mana potion')
shopModule:addBuyableItem({'great spirit potion'}, 8472, 190, 'great spirit potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 'health potion')
shopModule:addBuyableItem({'heavy magic missile rune'}, 2311, 12, 'heavy magic missile rune')
shopModule:addBuyableItem({'holy missile rune'}, 2295, 16, 'holy missile rune')
shopModule:addBuyableItem({'great holy rune'}, 2297, 45, 'great holy rune')
shopModule:addBuyableItem({'icicle rune'}, 2271, 30, 'icicle rune')
shopModule:addBuyableItem({'intense healing rune'}, 2265, 95, 'intense healing rune')
shopModule:addBuyableItem({'light magic missile rune'}, 2287, 4, 'light magic missile rune')
shopModule:addBuyableItem({'magic wall rune'}, 2293, 116, 'magic wall rune')
shopModule:addBuyableItem({'mana rune'}, 2270, 210, 'mana rune')
shopModule:addBuyableItem({'paralyze rune'}, 2278, 700, 'paralyze rune')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 'mana potion')
shopModule:addBuyableItem({'poison bomb rune'}, 2286, 85, 'poison bomb rune')
shopModule:addBuyableItem({'poison field rune'}, 2285, 21, 'poison field rune')
shopModule:addBuyableItem({'poison wall rune'}, 2289, 52, 'poison wall rune')
shopModule:addBuyableItem({'spellbook'}, 2175, 150, 'spellbook')
shopModule:addBuyableItem({'stalagmite rune'}, 2292, 12, 'stalagmite rune')
shopModule:addBuyableItem({'soulfire rune'}, 2308, 46, 'soulfire rune')
shopModule:addBuyableItem({'stone shower rune'}, 2288, 37, 'stone shower rune')
shopModule:addBuyableItem({'strong health potion'}, 7588, 100, 'strong health potion')
shopModule:addBuyableItem({'strong mana potion'}, 7589, 80, 'strong mana potion')
shopModule:addBuyableItem({'sudden death rune'}, 2268, 108, 'sudden death rune')
shopModule:addBuyableItem({'thunderstorm rune'}, 2315, 37, 'thunderstorm rune')
shopModule:addBuyableItem({'ultimate healing rune'}, 2273, 175, 'ultimate healing rune')
shopModule:addBuyableItem({'ultimate health potion'}, 8473, 310, 'ultimate health potion')
shopModule:addBuyableItem({'wild growth rune'}, 2269, 160, 'wild growth rune')


npcHandler:setMessage(MESSAGE_GREET, "Olá, |PLAYERNAME|! Compre potions e runas sem sair da sua {Cave Exclusiva}, basta dizer {trade}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até logo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até breve.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Eu vendo potions e runas! Dê uma olhada.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())