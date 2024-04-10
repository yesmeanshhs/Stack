local Class = {}

Class.__index = Class

Class.__tostring = function(self)
	local strings = {}
	for _, Item in ipairs(self.Data) do
		table.insert(strings, tostring(Item))
	end
	
	return "Stack, Contents: {" .. table.concat(strings, ", ") .. "}"
end

function Class.new()
	return setmetatable( {Data = {} } , Class)
end

function Class:push(...)
	local Packed = table.pack(...)
	for _, Data in ipairs(Packed) do
		table.insert(self.Data,  Data)
	end
end

function Class:pop()
	return table.remove(self.Data)
end

function Class:peek()
	return self.Data[#self.Data]
end

function Class:clear()
	self.Data = {}
end

function Class:isEmpty()
	return #self.Data == 0
end

function Class:size()
	return #self.Data
end

local function rpairs(Table)
	return function(Table, Index)
		Index += 1
		if not (Index == 0) and not ((Index - #Table) >= #Table) then
			return Index, Table[Index - #Table]
		end
	end, Table, #Table - 1
end

function Class:Iterator()
	return rpairs(self.Data)
end

return Class
