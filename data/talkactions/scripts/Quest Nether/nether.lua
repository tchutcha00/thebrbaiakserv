function onSay(cid, words, param, channel)
   local t = string.explode(param, " ")
   if t[1] == "nether" and t[2] == "tefar" then
      if isInArea(getThingPos(cid), {x = 993, y = 1709, z = 7}, {x = 995, y = 1711, z = 7}) then
         local gold = getTileItemById({x=994,y=1710,z=7}, 9971)
         if gold and gold.uid and gold.uid > 0 and gold.type >= 50 then
            doRemoveItem(gold.uid, 50)
            doTeleportThing(cid,{x = 1768, y = 1823, z = 14})
            doSendMagicEffect({x = 1768, y = 1823, z = 14}, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_DESCR, "Nether aceitou sua oferenda e te trouxe para a entrada do templo da Aura Espiritual.")
         else
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE, "Esta oferenda não é o suficiente.")
         end
         return true
      end
   end
   return false
end
