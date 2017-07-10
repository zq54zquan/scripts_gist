Account =  {balance = 1000}
function Account:discount(dis)  
	self.balance = self.balance - dis	
end

function Account:new(o)
	o = o or {}
	print(self)
	setmetatable(o,self)
	self.__index = self
	return o
end

Account.clear = function(self) 
	self.balance = 0;
end

ac = Account:new()
print(ac.balance)
ac:discount(10)
print(ac.balance)


SpecialAccount = Account:new()
function SpecialAccount:increase(inc) 
	self.balance = self.balance+inc
end	
		
ssac = SpecialAccount:new()
ssac:increase(10)
print(ssac.balance)
ssac:clear()
print(ssac.balance)
