function onTime()
	Castle48h:startVoteObjetive()
	for i = 1, 5, 2 do
		addEvent(broadcastMessage, i * 60 * 1000, 'Fique ligado, �s 21:00 o Castle War ser� aberto para batalha. Chame sua guild!')
	end

	addEvent(function() Castle48h:open() end, 7 * 60 * 1000)
	return true
end
