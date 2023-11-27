local msg = {

}

function onThink(interval, lastExecution)
	local h = msg[os.date('%X'):sub(1, 5)]
	return h and doBroadcastMessage(h.text, h.type) or true
end