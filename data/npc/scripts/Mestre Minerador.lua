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
  [6542] = {buy = 40, sell = 0}, 
  [6543] = {buy = 80, sell = 0}, 
  [6544] = {buy = 120, sell = 0},
  [6545] = {buy = 160, sell = 0},
  [2328] = {buy = 200, sell = 0},
  [6541] = {buy = 240, sell = 0},
  [12599] = {buy = 800, sell = 0},
  [8300] = {buy = 1000, sell = 0},
  [8305] = {buy = 75, sell = 0},
  [2816] = {buy = 300, sell = 0},
  [12372] = {buy = 40, sell = 0},
  [7489] = {buy = 80, sell = 0},
  [12601] = {buy = 40, sell = 0},
  [8978] = {buy = 2000, sell = 0},
  [3954] = {buy = 500, sell = 0},
}

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

for item, ret in pairs(items) do
  if ret.buy > 0 then shopModule:addBuyableItem(nil, item, ret.buy, nil, nil, ret.period and math.max(0, ret.period) or 0) end
  if ret.sell > 0 then shopModule:addSellableItem(nil, item, ret.sell) end
end

npcHandler:addModule(FocusModule:new())