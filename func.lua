function all_loop_map(paths,func) 
	for i,v in pairs(paths) do 
		func(i,v)
	end 
end

local pathes = {'2','e','d'; ["x"]="y"}
all_loop_map(pathes,print)
