function love.load()
	--API
	require("loader")

	loader.init()

	states.load()
	states.switch("game")

	--STATES
	

end



function love.update( dt )
	state.update(dt)
end

function love.draw()
	state.draw()
	achievements.draw()
	debug.draw()
end

function love.keypressed( key )
	achievements.unlock(1)
	if state.keypressed then
		state.keypressed(key)
	else
		print("NO KEYPRESS FUNCTION")
	end
end


function love.mousepressed( x, y, btn )
	if state.mousepressed then
		state.mousepressed( x, y, btn )
	else
		print("NO MOUSEPRESS FUNCTION")
	end
end
