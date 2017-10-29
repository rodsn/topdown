debug = {}

tDebug = {}
st = true

function debug.print( val, var )
	tDebug[tostring(val)] = {tostring(var), #tDebug+1}
	debug.draw()
end

function debug.toggle( state )
	if state then
		st = state
	else
		st = not st
		print(st)
	end
end

function debug.draw()
	if st then
		i = 0
		love.graphics.setColor(255,255,255,255)
		for k, v in pairs(tDebug) do
			i = i + 1
			love.graphics.print(k..": "..v[1], 5, i * 20 - 10)
		end
		--print(i)
	end
end