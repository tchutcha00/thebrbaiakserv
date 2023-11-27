local storage = 11269

function onUse(cid, item, fromPosition, itemEx, toPosition)
   setPlayerStorageValue(cid, storage, 1)
   doCreatureSay(cid, "Parabens, Voce recebeu o Acesso Max Donate.", TALKTYPE_ORANGE_1)
   doRemoveItem(item.uid)
   return true
   end