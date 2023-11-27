string.split = function (str)
	local t = {}
	return not str:gsub("%w+", function(s) table.insert(t, s) return "" end):find("%S") and t or {}
end

string.trim = function (str)
	return str:gsub("^%s*(.-)%s*$", "%1")
end

string.explode = function (str, sep, limit)
	if(type(sep) ~= 'string' or isInArray({tostring(str):len(), sep:len()}, 0)) then
		return {}
	end

	local i, pos, tmp, t = 0, 1, "", {}
	for s, e in function() return string.find(str, sep, pos) end do
		tmp = str:sub(pos, s - 1):trim()
		table.insert(t, tmp)
		pos = e + 1

		i = i + 1
		if(limit ~= nil and i == limit) then
			break
		end
	end

	tmp = str:sub(pos):trim()
	table.insert(t, tmp)
	return t
end

string.expand = function (str)
	return string.gsub(str, "$(%w+)", function(n) return _G[n] end)
end

string.diff = function (diff, translate)
	local format = {
		{not translate and 'week' or 'semana', diff / 60 / 60 / 24 / 7},
		{not translate and 'day' or 'dia', diff / 60 / 60 / 24 % 7},
		{not translate and 'hour' or 'hora', diff / 60 / 60 % 24},
		{not translate and 'minute' or 'minuto', diff / 60 % 60},
		{not translate and 'second' or 'segundo', diff % 60}
	}

	local t = {}
	for k, v in ipairs(format) do
		local d, tmp = math.floor(v[2]), ''
		if(d > 0) then
			tmp = (k < table.maxn(format) and (table.maxn(t) > 0 and ', ' or '') or (#t == 0 and '' or (not translate and ' and ' or ' e '))) .. d .. ' ' .. v[1] .. (d ~= 1 and 's' or '')
			table.insert(t, tmp)
		end
	end

	return table.concat(t)
end
string.timediff = string.diff

string.boolean = function (input)
	local tmp = type(input)
	if(tmp == 'boolean') then
		return input
	end

	if(tmp == 'number') then
		return input > 0
	end

	local str = string.lower(tostring(input))
	return (str == "yes" or str == "true" or (tonumber(str) ~= nil and tonumber(str) > 0))
end
getBooleanFromString = string.boolean

string.date = function (time, translate)
  local days = not translate and {'domingo', 'segunda-feira', 'terça-feira', 'quarta-feira', 'quinta-feira', 'sexta-feira', 'sábado'} or {'sunday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'}
  local months = not translate and {'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro'} or {'january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'}
  
  return ('%s, %s '.. (not translate and 'de' or 'of') ..' %s '.. (not translate and 'de' or 'of') ..' %s'):format(
    days[tonumber(os.date('%w', time)) + 1], 
    os.date('%d', time), 
    months[tonumber(os.date('%m', time))], 
    os.date('%Y', time))
end