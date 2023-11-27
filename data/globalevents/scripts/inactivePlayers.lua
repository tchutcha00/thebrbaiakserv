-- Clean inative players (last update at 04/18/2019 at 18:06)
local config = {

    level = 8, -- level a ser verificado
    reset = 0, -- reset a ser verificado
    inactiveFor = 180, -- jogador inativo por x dias
    checkDay = 30, -- dia do mes que será executado a otimização
    samples = {'Rook Sample', 'Sorcerer Sample', 'Druid Sample', 'Paladin Sample', 'Knight Sample', 'Account Manager', 'Admin'}
}

function onStartup()
    local day = tonumber(os.date('%d'))
    if day ~= config.checkDay then
        return
    end
    
    print('>> Limpando jogadores inativos...')
    local result = db.getResult(('SELECT name FROM players WHERE lastlogin < UNIX_TIMESTAMP() - (60 * %d) AND level <= %d AND reset <= %d'):format(config.inactiveFor, config.level, config.reset))
        
    if result:getID() ~= -1 then
        local i = 0
            
        repeat 
            local name = result:getDataString('name')
            if not isInArray(config.samples, name) then
                db.query(('DELETE FROM players WHERE name = "%s"'):format(name))
                i = i + 1
            end
        until not result:next()
        result:free()
            
        print(('>> %d players foram deletados por inatividade'):format(i))
    else
        print('>> Boas noticias, nenhum jogador inativo')
    end
end