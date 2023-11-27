local t = {
    gStorage = 25252,
    msgoff = "O evento de backpack terminou.",
    msg = "O evento backpack foi aberto, para entrar digite !eventobp em uma zona de prote��o!"
}

function onSay(cid, words, param)
    
    if param == nil then
        return doPlayerSendCancel(cid, "Commands param required.")
    end
    
    if param == "open" then
        if getGlobalStorageValue(t.gStorage) <= 0 then
            setGlobalStorageValue(t.gStorage, 1)
            doBroadcastMessage(t.msg)
        else
            doPlayerSendCancel(cid, "O evento j� est� aberto.")
        end
    elseif param == "close" then
        if getGlobalStorageValue(t.gStorage) >= 1 then
            setGlobalStorageValue(t.gStorage, 0)
            doBroadcastMessage(t.msgoff)
        else
            doPlayerSendCancel(cid, "O evento n�o est� aberto.")
        end
    end
   return true
end