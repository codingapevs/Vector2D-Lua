Ball = {_type = "Ball"}
vector = require("Vector2D")

function Ball.Create(x,y,m)
    local self = setmetatable({}, { __index = Ball })  
    self.position = vector.Create(x,y)
    self.velocity = vector.Create(0,0)
    self.acceleration = vector.Create(0,0)
    self.mass = m
	return self
end

return Ball