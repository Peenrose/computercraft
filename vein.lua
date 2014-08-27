stack = 1
dug = 0

pre_dig = false

turtle.select(1)
if (turtle.getItemCount(1) == 0) then
	turtle.dig()
	turtle.forward()
	pre_dig = true
end

label = os.getComputerLabel()

function update_label()
	os.setComputerLabel(stack.."/120, "..dug)
end

function try(func, tries)
	update_label()

	for i = 1, tries do
		success = func()

		if success == true then
			return true
		end
	end

	return false
end

function block(compare, dig, move, loop, back)
	if compare() then
		
		update_label()
		if not try(dig, 50) then
			return
		end
		dug = dug + 1

		update_label()
		if not try(move, 50) then
			return
		end

		stack = stack + 1

		if (stack < 120) then
			loop()
		end

		stack = stack - 1

		try(back, 1000)
	end
end

function loop()

	block(turtle.compare,     turtle.dig,     turtle.forward, loop, turtle.back) --compare front
	
	block(turtle.compareUp,   turtle.digUp,   turtle.up,      loop, turtle.down) --compare up

	block(turtle.compareDown, turtle.digDown, turtle.down,    loop, turtle.up  ) --compare down


	turtle.turnLeft()
	block(turtle.compare, turtle.dig, turtle.forward, loop, turtle.back) --compare front

	turtle.turnLeft()
	block(turtle.compare, turtle.dig, turtle.forward, loop, turtle.back) --compare front

	turtle.turnLeft()
	block(turtle.compare, turtle.dig, turtle.forward, loop, turtle.back) --compare front
	
	turtle.turnLeft()

end

loop()

os.setComputerLabel(label)
if pre_dig == true then
	turtle.back()
end