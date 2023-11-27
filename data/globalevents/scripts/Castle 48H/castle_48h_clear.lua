function onTime()
	Castle48h:clear()
	db.executeQuery('UPDATE `castle48h_config` SET `guild_id` = 0')
	return true
end
