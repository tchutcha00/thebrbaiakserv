function onSay(cid, words, param)
	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

    doPlayerPopupFYI(cid, "O que é o sistema de resets?\nO sistema de resets consiste em melhorar sua jogabilidade, ou seja, quanto mais resets, mais resistente seu personagem será.\nLembrando que quando resetado, o personagem volta aos leveis iniciais, a cap retorna ao valor equivalente ao nível. Suas skills permanecem as mesmas.\n\nComo resetar e quando resetar?\nPara resetar, use o comando (!resetar). Você pode resetar a partir de 15000 leveis, variando conforme os resetes for aumentando.\n\n* Quanto maior o level que você resetar, mais life e mana terá e quanto mais reset maior o seu dano (esse pode ser um grande diferencial seu para/com seus inimigos).")
    return true
end