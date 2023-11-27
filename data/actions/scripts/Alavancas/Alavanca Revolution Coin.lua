local coin = 10558
local lever = {
 
[9501] = {50,12734},
[9502] = {5,2328},
[9503] = {20,12735},

}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                  return doPlayerPopupFYI(cid, "Você precisa de "..lever[item.actionid][1].." " ..getItemNameById(coin))
                  end
                                doPlayerAddItem(cid,lever[item.actionid][2])
                                doPlayerPopupFYI(cid, "Você Acaba De Adquirir Um(a) " .. getItemNameById(lever[item.actionid][2]))
                                doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
                                doTransformItem(item.uid, item.itemid == 1945 and 1945 or 1945)
                return true
end