function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor) 
storage_guild = getGlobalStorageValue(123123) 
local tpos,v = {x=445,y=376,z=7},getThingPos(cid) -- POSIÇÃO QUE O PLAYER VAI SER TELEPORTADO AO SER EXPUSLO!

if isPlayer(cid) then 
if getPlayerGuildId(cid) == storage_guild then 
doTeleportThing(cid,position) 
else 
doTeleportThing(cid,tpos) 
doCreatureSay(cid, "[Castle24hrs] Sua guild não é mais dona do Castle e você foi expulso! :(", TALKTYPE_SAY) 
doSendMagicEffect(getPlayerPosition(cid),6) 
end 
return true 
end
end