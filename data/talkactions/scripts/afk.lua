local FRASES = {"Ausente!", "Ausente!", "AFK!", "Volto já!", "Ocupado."} -- Auto-Mensagens.
local TEMPO = 1 -- Intervalo de Tempo em segundos.

local function doSendAutoMessage(cid, pos)
if (isCreature(cid) == TRUE) then
npos = getThingPos(cid)
if (pos.x == npos.x) and (pos.y == npos.y) and (pos.z == npos.z) then
doSendAnimatedText(pos, FRASES[math.random(#FRASES)], 215)
doSendMagicEffect(pos, 13)
addEvent(doSendAutoMessage, TEMPO*1000, cid, npos)
end
end
end

function onSay(cid, words, param)
pos = getThingPos(cid)
doSendAnimatedText(pos, FRASES[math.random(#FRASES)], 215)
doSendMagicEffect(pos, 13)
doPlayerSendCancel(cid, "Vocês Esta Ausente")
addEvent(doSendAutoMessage, TEMPO*1000, cid, pos)
return TRUE
end 