function Render(xAndOs)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(mainFont)

  love.graphics.line(winW/3, 0, winW/3, winH)
  love.graphics.line(winW*(2/3), 0, winW*(2/3), winH)
  love.graphics.line(0, winH/3, winW, winH/3)
  love.graphics.line(0, winH*(2/3), winW, winH*(2/3))

  for row=1,3 do
    for column=1,3 do
      local state = xAndOs[row][column][1]
      local x = xAndOs[row][column][2]
      local y = xAndOs[row][column][3]

      love.graphics.print(state, x, y, 0, 1, 1, -128/2.5)
    end
  end

  if gameState == "gameOver" then
    love.graphics.setFont(gameOverFont)
    love.graphics.setColor(0, 1, 0)
    if winner == "Tie" then
      love.graphics.print("It's a tie!", 0, winH/2-32, 0, 1, 1)
    else
      love.graphics.print("The winner is "..winner, 0, winH/2-32, 0, 1, 1)
    end
  end
end
