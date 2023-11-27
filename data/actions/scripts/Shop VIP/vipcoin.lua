local coin = 11192
local lever = {
 
[9401] = {10,12641},
[9402] = {10,12642},
[9403] = {10,12643},
[9404] = {10,12644},
[9405] = {10,12645},
[9406] = {5,12655},
[9407] = {10,12636},
[9408] = {10,12637},
[9409] = {10,12638},
[9410] = {10,12639},
[9411] = {10,12640},
[9412] = {5,12621},
[9413] = {10,12625},
[9414] = {10,12626},
[9415] = {10,12627},
[9416] = {10,12628},
[9417] = {10,12650},
[9418] = {5,12663},
[9419] = {5,12664},
[9420] = {5,12665},
[9421] = {15,10132},
[9422] = {25,10131},
[9423] = {50,12735},
[9424] = {20,12680},
[9425] = {10,8305},
[9426] = {25,11296},
[9427] = {25,11295},
[9428] = {25,11298},
[9429] = {25,11297},
[9430] = {25,12733},
[9431] = {15,12289},
[9432] = {15,6543},

}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                  return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você Precisa De "..lever[item.actionid][1].." " ..getItemNameById(coin))
                  end
                                doPlayerAddItem(cid,lever[item.actionid][2])
                                doPlayerSendTextMessage(cid,22,"Você Acaba De Adquirir Um(a) " .. getItemNameById(lever[item.actionid][2]))
                                doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
                                doTransformItem(item.uid, item.itemid == 1945 and 1945 or 1945)
                return true
end