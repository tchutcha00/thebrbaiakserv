function onSay(cid, words, param)
        doPlayerPopupFYI(cid, "expPotions")
        if exhaustion.get(cid, 500001) then
                doPlayerSendCancel(cid, 'You can use this command only once per 5 seconds.')
                return true
        end
        exhaustion.set(cid, 500001, 5)

    return expPotions:onSay(cid, words, param)
end
