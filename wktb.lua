a = {}
b = {}
setmetatable(a,b)
b.__mode = "k"
s = "key"
a[s] = "value"
print(a[s])
s = "key1"
print(a["key"])
tbk = {}
a[tbk] = "tbkvalue"
function printtb(t) 
	for k in pairs(t) do 
			print(k,t[k])
	end
end

printtb(a)
tbk = {}
collectgarbage()
print("--------------------")
printtb(a)
