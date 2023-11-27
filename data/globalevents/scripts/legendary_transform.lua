local items = {12661, 12748, 12772, 12751, 12749}
local position = {x = 112, y = 85, z = 7}

if not legendTransform then
	legendTransform = {
		index = 1,
		lastItem = items[1]
	}
end

function onThink()
	local item = getTileItemById(position, legendTransform.lastItem).uid
	if item ~= 0 then
		local nextIndex = legendTransform.index + 1
		local nextItem = items[nextIndex]
		
		doSendMagicEffect(position, CONST_ME_MAGIC_GREEN)
		doTransformItem(item, nextItem)
		
		legendTransform.index = nextIndex < #items and nextIndex or 0
		legendTransform.lastItem = nextItem
	end
	return true
end
