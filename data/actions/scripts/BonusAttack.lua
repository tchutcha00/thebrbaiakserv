function restTempo(storage)
  local segundos, minutos, horas = 0,0,0
  local tot = storage - os.time()
  horas = math.floor(tot/3600)
  tot = tot - horas * 3600
  minutos = math.floor(tot/60)
  tot = tot - minutos * 60
  segundos = tot
  return string.format("O seu Bonus Attack ja esta ativo, restam %.2d:%.2d:%.2d para acabar e usar novamente.", horas, minutos, segundos)
end

function onUse(cid, item, fromPosition, itemEx, toPosition) -- By Zefz
	local storage =  201234
	local quest = 84738
	local wait = 72

		if(item.itemid == 6547) then
			if getPlayerStorageValue(cid, storage) <= os.time() then
				if getPlayerStorageValue(cid, quest) >= 1 then
					setPlayerStorageValue(cid, storage, os.time() + wait * 60 * 60)
					doPlayerSendTextMessage(cid,25, "Bonus Attack de 72h ativado!")
					doSendMagicEffect(getCreaturePosition(cid), 50)
					doTransformItem(item.uid, 8204, 1)
				else
					doPlayerSendTextMessage(cid,25, "Você precisa completar a quest do Bonus Attack para usar este item.")
				end
			else
				 doPlayerSendTextMessage(cid,25, restTempo(getPlayerStorageValue(cid, storage)))
			end
		end
	return true
end
