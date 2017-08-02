
function love.load()
	vector = require("Vector2D")
    v1 = vector.Create(10,8)
	v2 = vector.Create(300,300)
	
end
function love.update(dt)
	
    
end

function love.draw()
    
	love.graphics.setColor(123,43,51)
	love.graphics.print(v1.x,400,400)
	love.graphics.line( v1.x, v1.y, v2.x, v2.y )
end



