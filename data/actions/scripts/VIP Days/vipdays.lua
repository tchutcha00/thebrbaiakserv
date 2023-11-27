function onUse(cid, item, fromPosition, itemEx, toPosition)
  if (not getTilePzInfo(getCreaturePosition(cid))) then
    return doPlayerSendCancel(cid, "Você precisa estar em Protect Zone para utilizar o item.")
  end

  if item.itemid == 12734 then
    if doRemoveItem(item.uid, 1) then
      doPlayerAddPremiumDays(cid, 1)
      doCreatureSay(cid,"Você recebeu 1 dias de VIP Donate!", TALKTYPE_ORANGE_1)
      doSendMagicEffect(getThingPos(cid),38)
    else
      return doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
    end

  elseif item.itemid == 3954 then
    if doRemoveItem(item.uid, 1) then
      doPlayerAddPremiumDays(cid, 3)
      doCreatureSay(cid,"Você recebeu 3 dias de premium account!", TALKTYPE_ORANGE_1)
      doSendMagicEffect(getThingPos(cid),38)
    else
      return doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
    end
	
	  elseif item.itemid == 12752 then
    if doRemoveItem(item.uid, 1) then
      doPlayerAddPremiumDays(cid, 3)
      doCreatureSay(cid,"Você recebeu 3 dias de premium account!", TALKTYPE_ORANGE_1)
      doSendMagicEffect(getThingPos(cid),38)
    else
      return doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
    end

  elseif item.itemid == 12736 then
    if doRemoveItem(item.uid, 1) then
      doPlayerAddPremiumDays(cid, 5)
      doCreatureSay(cid,"Você recebeu 5 dias de VIP Donate!", TALKTYPE_ORANGE_1)
      doSendMagicEffect(getThingPos(cid),38)
    else
      return doPlayerSendTextMessage(cid,25,"ERROR! Contact the Administrator.")
    end
  end
  return true
end