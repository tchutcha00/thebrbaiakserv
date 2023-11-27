local storage = 11189

function onUse(cid, item, fromPosition, itemEx, toPosition)
   setPlayerStorageValue(cid, storage, 1)
   doCreatureSay(cid, "Parabens, Voce recebeu o Extreme Acesso.", TALKTYPE_ORANGE_1)
   doRemoveItem(item.uid)
   return true
   end