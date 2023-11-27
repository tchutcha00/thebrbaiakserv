-- By Slaake for Tibia King --
local time = 20
local tempo = 30

function onUse(cid, item, fromPosition, itemEx, toPosition)


         POS = {x=78, y=147, z=7}


         if (getPlayerItemCount(cid, 5906) >= 100) then

            doPlayerRemoveItem(cid, 5906,100)

            doPlayerSendTextMessage(cid, 19,'MENSAGEM')

            doTeleportThing(cid, POS)


         else doPlayerSendCancel(cid, 'Voce precisa de 100 Boss Token!')


              return true

              end

         end