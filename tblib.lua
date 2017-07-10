--------------------------------------------------------------------------------
--   if version equals 5.2(my mac) , define the get n function for 
--   the specific verion
--   alse define the associated setn function, it will remove the elements in 
--   the box outiside of the v param
--------------------------------------------------------------------------------
if string.find(_VERSION, "5.2") then
	table.getn = function(t) 
			if t.n ~= nil then 
					return t.n
			else 
				local n = 0
				for i in pairs(t) do
					if type(i) == "number" then 
						n = math.max(n,i)	
					end 
				end
				return n
			end
		end
	
	table.setn = function(t,v)
			if t.n ~= nil then
				t.n = v 
			else 
				for i in pairs(t) do
					if type(i) == "number" and i>v then 
							t[i] = nil
					end 
				end 
			end
		end
end

--------------------------------------------------------------------------------
--  sort table by function f
--  the will return a iterator can be use in a for in loop
--------------------------------------------------------------------------------
function sort_map_func(t,f) 
		local st = {}
		for k in pairs(t) do
			table.insert(st,k)
		end
		local i  = 0
		table.sort(st)
		function iterator_map()
			i = i+1;
			local v = st[i]
			if v == nil then 
				return nil , nil
			else 
				return v, t[v]
			end
		end
		return iterator_map;
	end

--------------------------------------------------------------------------------
--  test code for the defined getn function the t array has a nil, the function 
--  also run norally
--------------------------------------------------------------------------------
local t = {1,2,3,nil,4}
print(table.getn(t))
table.setn(t,3)
print(table.getn(t))

--------------------------------------------------------------------------------
--  test code for the table sort iterator function , use nil as sort function
--  sort function will treat the function as default, use ascii character to s
--  -ort the tables key 
--------------------------------------------------------------------------------
local m = {b = 1,a = 2,d = 5, c= 7}
for i,v in sort_map_func(m) do
	print(i, v)
end
