local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)        npcHandler:onCreatureAppear(cid)      end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()              npcHandler:onThink()            end
function onPlayerEndTrade(cid)        npcHandler:onPlayerEndTrade(cid)      end
function onPlayerCloseChannel(cid)      npcHandler:onPlayerCloseChannel(cid)    end

local items = {
	[12599] = {buy = 90, sell = 0},
	[12607] = {buy = 150, sell = 0, period = 21600}, 
	[3973] = {buy = 150, sell = 0, period = 21600},
	[2816] = {buy = 70, sell = 0},
	[5906] = {buy = 10, sell = 0},
}

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

for item, ret in pairs(items) do
	if ret.buy > 0 then shopModule:addBuyableItem(nil, item, ret.buy, nil, nil, ret.period and math.max(0, ret.period) or 0) end
	if ret.sell > 0 then shopModule:addSellableItem(nil, item, ret.sell) end
end

npcHandler:addModule(FocusModule:new())