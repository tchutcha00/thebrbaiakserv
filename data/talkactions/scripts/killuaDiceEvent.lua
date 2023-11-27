local config = {
   TELEPORT_pos = {x = 115, y = 83, z = 7},
   EVENT_pos = {x=1219,y=1164,z=7}
}
 
function onSay(cid, param)
   local tp = getTileItemById(config.TELEPORT_pos, 1387)
 
   if tp.uid > 100 then
      doRemoveItem(tp.uid)
      doBroadcastMessage("[Dice Event] O teleport foi fechado!")
   else
      doCreateTeleport(1387, config.EVENT_pos, config.TELEPORT_pos)
      doBroadcastMessage("[Dice Event] O teleport para o dice event está aberto no templo!")
   end
 
   return true
end
