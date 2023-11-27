function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 2739) then
		doTransformItem(itemEx.uid, 2737)
		doPlayerAddItem(cid, 2694, 1)
		doDecayItem(itemEx.uid)
		return true
	end
	return destroyItem(cid, itemEx, toPosition)
end
