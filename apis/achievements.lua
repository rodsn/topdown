achievements = {}
tAchievements = {}
tQueue = {{unlocked=true}}

function achievements.addAchievement(id, title, desc, color, text, img)
	if id == nil or title == nil or desc == nil or color == nil or text == nil then
		error("expected parameter, got nil", 2)
	end
	if img then
		iw, ih = img:getDimensions()
		if iw / ih ~= 1 then
			error("image ratio must be 1 (same width and same height)", 2)
		end
	end

	tAchievements[id] = {desc=desc, title=title, unlocked=false, timer=0, x=20, y=-10, alpha = 255, color=color, text=text, img=img}
end

function achievements.unlock( id )
	tQueue[#tQueue+1] = tAchievements[id]
end

function achievements.draw()
	for k, v in pairs(tQueue) do

		if k > 1 and tQueue[k-1]["unlocked"] == true then
			if not v.unlocked then
				drawDT = love.timer.getDelta()
				v.timer = v.timer + drawDT
				v.y = v.y + drawDT * 40
				v.alpha = v.alpha - drawDT * 50
			end


			--print(v.timer)
			if v.timer >= 5 and not v.unlocked then
				v.unlocked = true
				v.timer = 0
		
				
				--print("Achievement unlocked: "..v.desc)
			end

			if not v.unlocked then
				if v.alpha < 0 then
					v.alpha = 0
				end
				r, g, b, a = love.graphics.getColor()
				love.graphics.setColor(v.color[1],v.color[2],v.color[3], v.alpha)
				love.graphics.rectangle("fill", v.x, v.y/(v.timer*2), 400, 30)
				love.graphics.setColor(v.text[1],v.text[2],v.text[3], v.alpha)
				love.graphics.print(v.title, v.x+8, v.y/(v.timer*2)+8)
				love.graphics.setColor(r, g, b, a)
			end
		end
	end
end

function achievements.get()
	return tAchievements
end