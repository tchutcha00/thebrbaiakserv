function onUse(cid, item, fromPosition, itemEx, toPosition)
	local info = 'Informa��o:\n\nBem-vindo as caves exclusivas.\nDigite !cave stats para saber quais s�o os donos atuais ou !cave time para saber quanto tempo falta para sua cave acabar.\nComo adquirir?\n\nCom 3kkk, voc� deve ter na sua backpack 30 pacotes de 100kk. S�o 12 caves dispon�veis no servidor.\n\nCompre agora mesmo e aproveite, sendo livre totalmente de divis�o de exp ou de players mal intencionados.\n\nFa�a loot e aproveite. Bom jogo a todos!'
	doShowTextDialog(cid, 8977, info)
	return true
end
