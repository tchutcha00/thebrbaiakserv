function onUse(cid, item, fromPosition, itemEx, toPosition)
	local info = 'Informa��o:\n\nAqui se encontra os itens mais raros do servidor. Como adquirir?\n\nCom uma hyper key, voc� pode tentar a sorte em uma das alavancas, podendo ganhar o item mais raro da mesma e se tornar um jogador lend�rio. S�o 5 itens lend�rios ao todo e h� uma alavanca para cada um.\n\nEmbora voc� n�o esteja com sorte, sempre sair� ganhando algo mesmo que n�o seja lucrativo.\n\nCompre uma hyper key e tente. Boa sorte!'
	doShowTextDialog(cid, 8977, info)
	return true
end
