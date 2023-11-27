-- Daily Monster adapted to base 0.3.7 at 08/27/2019 by Lyuzera.

DAILYMONSTER_EXPERIENCE = 1
DAILYMONSTER_LOOT = 2

DAILYMONSTER_FIRST = DAILYMONSTER_EXPERIENCE
DAILYMONSTER_LAST = DAILYMONSTER_LOOT

dailyMonster = {
	lootType = {
		percent = {7, 15}, -- porcentagem minima e máxima do loot (random)
		monsters = {''} -- criaturas que podem ser sorteadas com o tipo Loot (random)
	},

	experienceType = {
		percent = {15, 30}, -- porcentagem minima e máxima de experience (random)
		monsters = {'Frost Giants', 'Retroder', 'Demonio', 'Baby Hades', 'Archimonda', 'Overlord', 'Irahsae', 'Lord Nightmare', 'Obelisco Do Mar', 'Kong', 'Undead Darkshadow', 'Archangel', 'Alibaba', 'Jimmy Swamp', 'Dementador', 'Irlanquen', 'Super Archangel', 'Super Alibaba', 'Super Kong', 'Super Jimmy Swamp', 'Supremo Demon', 'Supremo Warlock', 'Super The Emperor', 'Super Supremo Demon', 'Supremo Hellhound', 'Super Supremo Draken Elite', 'Super Supremo Dragon Lord', 'Supremo Ashmunrah', 'Supremo Glacial Giant', 'Super Supremo Lord Nightmare', 'Supremo Draken Elite', 'Supremo Sea Serpent Ice', 'Supremo Draconia', 'Supremo Lord Nightmare', 'Supremo Gelidrazah', 'Supremo Dragon Lord', 'Wild Ninja Supremo', 'Supremo The Old Widow', 'Super Frost Viserion', 'Super Frost Spatial', 'Super Supremo Draconia', 'Super Supremo Balafhar', 'Super Supremo Sapphire', 'Angry Demon Supremo', 'Cave Spider', 'Supremo Rotworm Queen', 'Super Supremo Ice Golem', 'Super Supremo Fire Overlord', 'Sight Of Surrender', 'Guzzlemaw'} -- criaturas que podem ser sorteadas com o tipo experience (random)
	}
}

function dailyMonster.onStartup(self)
	math.randomseed(os.mtime())
	local type = math.random(DAILYMONSTER_FIRST, DAILYMONSTER_LAST)
	local name = 'unknown'
	local percent = 0
	local typeName = 'none'

	if type == DAILYMONSTER_EXPERIENCE then
		name = self.experienceType.monsters[math.random(1, #self.experienceType.monsters)]
		percent = math.random(self.experienceType.percent[1], self.experienceType.percent[2])
		typeName = 'Experience'
	elseif type == DAILYMONSTER_LOOT then
		name = self.lootType.monsters[math.random(1, #self.lootType.monsters)]
		percent = math.random(self.lootType.percent[1], self.lootType.percent[2])
		typeName = 'Loot'
	end

	setGlobalStorageValue('dailymonstername', name)
	setGlobalStorageValue('dailymonstertype', type)
	setGlobalStorageValue('dailymonsterpercent', percent)
	
	updateDailyMonster(name, type, percent)
	db.executeQuery('INSERT INTO `daily_monster` (`name`, `type`, `percent`, `lastday`) VALUES (' .. db.escapeString(name) .. ', ' .. type .. ', ' .. percent .. ', ' .. os.time() .. ')')

	print('>> ' .. name .. ' is the boosted creature of today ('.. percent .. '% of '  .. typeName .. ')')	
end