local info = 'Bem-vindo ao KING-BAIAK,\n\nDicas UPlevel:\n- Use EXP Foods para acumular o bonus de EXP, Lembrando que se vc morrer ou relogar o bonus acumulado sera perdido.\n\nDicas de reset:\n- Use o comando !reset para saber mais detalhes.\n\nDicas uteis:\nUlize os comando !status para HP e MP\n- O respawn das criaturas podem receber um boost devido � quantidade de jogadores online, melhorando a ca�a dos jogadores.\n\nO respawn est�: %s.'
function onUse(cid, item)
    local divider = getRespawnDivider()
    doShowTextDialog(cid, 5952, info:format((divider > 1 and '[' .. divider .. 'X] MAIS R�PIDO' or 'NORMAL')))
    return true
end