vector = require("Vector2D")
ball1 = require("Ball") 
wind = vector.Create(2,0)
gravity =vector.Create(0,1)
friction = vector.Create(0,0)
fric_c=0.01
balls={}

function love.load()
	for i=0, 20 do
		local ball = ball1.Create(math.random( 400 ),0,math.random(20))
		table.insert(balls,ball)
	end	

end

function love.update(dt)
	for key,b in pairs(balls) do
		friction:setV(b.velocity)
		friction:mult(-1)
		friction:norm()
		b.acceleration:add(gravity)
		b.acceleration:add(vector:Div(friction,b.mass))
		b.acceleration:add(vector:Div(wind,b.mass))
		b.velocity:add(b.acceleration)
		b.position:add(b.velocity)

		if(b.position.x<0) then
			b.position.x=0
			b.velocity.x=b.velocity.x*-1
		elseif(b.position.x>800) then
			b.position.x=800
			b.velocity.x=b.velocity.x*-1
		end
		if(b.position.y<0) then
			b.position.y=0
			b.velocity.y=b.velocity.y*-1
		elseif(b.position.y>600) then
			b.position.y=600
			b.velocity.y=b.velocity.y*-1
		end	
		b.acceleration:mult(0)
	end
end

function love.draw()
    for key,b in pairs( balls ) do
		love.graphics.setColor(123,43,51)
		love.graphics.circle("fill",b.position.x, b.position.y, 10, 10 )
	end
end



