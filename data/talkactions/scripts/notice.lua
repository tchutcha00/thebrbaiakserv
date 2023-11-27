--- Script by esK~---
--- Notice System 0.1 Beta ---
function onSay(cid, words, param)
	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

file = io.open('elfbot.txt','r')
notice = file:read(-1)
doShowTextDialog(cid,7528,notice)
file:close()
end