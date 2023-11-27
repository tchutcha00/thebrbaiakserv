local Configs = {
	Exhausted = 180,
	Storage_Exhausted = 5000001,
	Messages = {
		SALVED = "You character has been salved.",
		EXHAUST = "You need wait %d seconds to save again.",
	},
}

local function doSavePlayerAndHouse(cid)
    doPlayerSave(cid)
    if getHouseByPlayerGUID(getPlayerGUID(cid)) then
        doSaveHouse(getHouseByPlayerGUID(getPlayerGUID(cid)))
    end
    return true
end

function onSay(cid, words, param)
	if getPlayerStorageValue(cid, Configs.Storage_Exhausted) >= os.time() then
		doPlayerSendCancel(cid, string.format(Configs.Messages.EXHAUST, getPlayerStorageValue(cid, Configs.Storage_Exhausted) - os.time()))
		return true
	end
	doSavePlayerAndHouse(cid)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, Configs.Messages.SALVED)
	setPlayerStorageValue(cid, Configs.Storage_Exhausted, os.time() + Configs.Exhausted)
	return true
end