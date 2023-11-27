local config = {
	messageDontHave = 'You don\'t have condition infight (Pz)',
	MessageHave = 'You have to wait %d seconds to clean your condition infight (Pz).'
}

function onSay(cid, words, param)
	local conditionInfo = getCreatureConditionInfo(cid, CONDITION_INFIGHT, 0, CONDITIONID_DEFAULT)
	if not conditionInfo then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.messageDontHave)
		return true
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.MessageHave:format(conditionInfo.ticks / 1000))
	return true
end
