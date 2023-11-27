function onUse(cid, item, fromPosition, itemEx, toPosition)
	local info = 'Informação:\n\nAqui se encontra os itens mais raros do servidor. Como adquirir?\n\nCom uma hyper key, você pode tentar a sorte em uma das alavancas, podendo ganhar o item mais raro da mesma e se tornar um jogador lendário. São 5 itens lendários ao todo e há uma alavanca para cada um.\n\nEmbora você não esteja com sorte, sempre sairá ganhando algo mesmo que não seja lucrativo.\n\nCompre uma hyper key e tente. Boa sorte!'
	doShowTextDialog(cid, 8977, info)
	return true
end
