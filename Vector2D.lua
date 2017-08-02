Vector2D = {_type = "Vector2D"}

function Vector2D.Create(a,b)
    local self = setmetatable({}, { __index = Vector2D })  
    self.x=a
    self.y=b
	
	return self
end

function Vector2D:set(a,b)
	self.x=a
	self.y=b
end

function Vector2D:setV(a)
	self.x=a.x
	self.y=a.y
end

function Vector2D:add(a)
	self.x=self.x+a.x
	self.y=self.y+a.y
end

function Vector2D:sub(a)
	self.x=self.x-a.x
	self.y=self.y-a.y
end

function Vector2D:mult(a)
	self.x=self.x*a
	self.y=self.y*a
end

function Vector2D:div(a)
	self.x=self.x/a
	self.y=self.y/a
end

function Vector2D:mag()
	return math.sqrt((self.x)^2+(self.y)^2)
end

function Vector2D:magsq()
	return (self.x)^2+(self.y)^2
end

function Vector2D:setmag(lenght)
	self:norm()
	self:mult(lenght)	
end

function Vector2D:norm()
	local mag=self:mag()
	if mag > 0 then
		self.x=self.x/mag
		self.y=self.y/mag
	else
		self.x=self.x
		self.y=self.y
	end
end

function Vector2D:limit(limit)
	if(self:magsq() > limit*limit) then
		self:norm()
		self:mult(limit)	
	end
end

function Vector2D:get_angle()
    angle=math.atan2(self.y,self.x)
    return angle
end

function Vector2D:set_angle(angle)
	self.x = math.cos(angle)
	self.y = math.sin(angle)
end


--class methods

function Vector2D:From_angle(angle)
	local v={x=0,y=0}
	v.x = math.cos(angle)
	v.y = math.sin(angle)
	return v
end

function Vector2D:Dot_product(a,b)
	 return a.x*b.x + a.y*b.y
end

function Vector2D:Add(a,b)
    local v={x=0,y=0}   
	v.x=a.x+b.x
	v.y=a.y+b.y
    return v
end

function Vector2D:Sub(a,b)
    local v={x=0,y=0}   
	v.x=a.x-b.x
	v.y=a.y-b.y
    return v
end

function Vector2D:Mult(a,lenght)
	local v={x=0,y=0}   
    v.x=a.x*lenght
	v.y=a.y*lenght
    return v
end

function Vector2D:Div(a,lenght)
	local v={x=0,y=0}   
    v.x=a.x/lenght
	v.y=a.y/lenght
	
    return v
end

function Vector2D:Mag2(a,b)
	return math.sqrt((a.x-b.x)^2+(a.y-b.y)^2)
end
return Vector2D