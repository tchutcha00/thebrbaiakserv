  ---------------                                                   
-----BY PC98-------  
  ---------------                                                   
         
function onStepIn(cid, item, position, fromPosition)

-------------------------Config-----------------------------------------------------------------
storage_guild = getGlobalStorageValue(123123)  -- A 3ª storage configurada em Castle.lua

-------------------------Fim de Config-----------------------------------------------------------


if getPlayerGuildId(cid) == storage_guild then
   doTeleportThing(cid,getThingPos(item.uid))
   doTransformItem(item.uid, door_opened)
   doPlayerSendTextMessage(cid, 22, "Seja bem vindo a vosso castelo!")   
   return TRUE
else
    if guarda_ativ == 1 then
       doPlayerSendTextMessage(cid, 22, "Este castelo nao pertence a sua guild")
        for i=1, guarda_cont do
            
        end
    return FALSE
    else
    doPlayerSendTextMessage(cid, 22, "Este castelo nao pertence a sua guild")
    return FALSE
    end
end
end