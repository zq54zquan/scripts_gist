#!/bin/lua
th = coroutine.create(
	function(a, b, c) 
		for i = 1,3 do 
			print(a,b,c)
			coroutine.yield(i)
		end
		return 12;
	end
)
for i = 1,3 do 
		status,v,k= coroutine.resume(th,1,2,45)
		print(status,v,k)
end
