function onDeath(cid, corpse, deathList)
    if isPlayer(deathList[1]) and not isPlayer(cid, target) then
        doPlayerAddItem(deathList[1], 12599, 5) -- itemid, amount
        doSendMagicEffect(getPlayerPosition(deathList[1]), 27)
        
        doBroadcastMessage("O jogador( "..getCreatureName(deathList[1]).." ) Matou o BOSS CLAPTOMANIACO e ganhou [5 Exp 800%] Parabens!!!")
        
    end
    return true
end