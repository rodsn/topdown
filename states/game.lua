game = {}

function game.load(  )
end

function game.update( dt )
end

function game.draw(  )
	debug.print("Fps", love.timer.getFPS())
	love.graphics.print("Ola bife", 20, 20)
end

function game.keypressed( key )

end

function game.mousepressed( x, y, btn )

end

return game
