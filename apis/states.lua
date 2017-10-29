states = {}

tStates = {}

state_name = ""



function states.load()
	files = love.filesystem.getDirectoryItems("/states")

	for k, v in pairs(files) do
		--if love.filesystem.isDirectory(v) then
			obj = require("states/"..v:sub(1, -5))
			tStates[v:sub(1, -5)] = obj
		--end
	end
end

function states.switch( name )
	state_name = name
	state = tStates[state_name]
	if state.load then
		state.load()
	end
end