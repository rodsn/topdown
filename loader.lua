loader = {}
t_audio = {}
function loader.init(  )
	files = love.filesystem.getDirectoryItems("/apis")

	for k, v in pairs(files) do
		require("apis/"..v:sub(1, -5))
	end

	files = love.filesystem.getDirectoryItems("/res/audio")
	for k, v in pairs(files) do
		print(v:sub(1, -5))
		t_audio[v:sub(1, -5)] = love.audio.newSource("res/audio/"..v)
	end
	
end