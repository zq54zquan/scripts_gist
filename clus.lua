#!/bin/lua
function increamer(i) 
	return function(x) 
			i = i+1;
			return x+i;
		end
end

inc1 = increamer(1)
print(inc1(3))
print(inc1(4))
