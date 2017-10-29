game = {}

function game.load(  )
	local socket = require "socket"
	local address, port = "25.95.217.205", 13243

	udp = socket.udp()
	udp:settimeout(0)
	udp:setpeername(address, port)
end

function game.update( dt )
end

function game.draw(  )
	debug.print("Fps", love.timer.getFPS())
	
end

function game.keypressed( key )
	udp:send(key)
end

function game.mousepressed( x, y, btn )

end

return game
