function CheckCollision(mouseX,mouseY, x,y,w,h)
  return mouseX < x+w and
         mouseX > x and
         mouseY < y+h and
         mouseY > y
end
----------------------------------------------------------

function love.load()
  Object = require "classic"
  require "renderer"
  require "checker"

  love.graphics.setBackgroundColor(0, 0, 0)
  mainFont = love.graphics.newFont("cour.ttf", 256)
  gameOverFont = love.graphics.newFont("cour.ttf", 64)
  debugFont = love.graphics.newFont("cour.ttf", 16)

  winW = love.graphics.getWidth()
  winH = love.graphics.getHeight()

  VERTICAL_LINE_LEFT_X = winW/3
  VERTICAL_LINE_RIGHT_X = winW*(2/3)
  HORIZONTAL_LINE_TOP_Y = winH/3
  HORIZONTAL_LINE_BOTTOM_Y = winH*(2/3)

  xAndOs = {
    {{' ',0,0}, {' ',VERTICAL_LINE_LEFT_X,0}, {' ',VERTICAL_LINE_RIGHT_X,0}},
    {{' ',0,HORIZONTAL_LINE_TOP_Y}, {' ',VERTICAL_LINE_LEFT_X,HORIZONTAL_LINE_TOP_Y}, {' ',VERTICAL_LINE_RIGHT_X,HORIZONTAL_LINE_TOP_Y}},
    {{' ',0,HORIZONTAL_LINE_BOTTOM_Y}, {' ',VERTICAL_LINE_LEFT_X,HORIZONTAL_LINE_BOTTOM_Y}, {' ',VERTICAL_LINE_RIGHT_X,HORIZONTAL_LINE_BOTTOM_Y}},
  }

  currentState = 'O'

  gameState = "game"
  winner = ''

end

function love.update(dt)
  if gameState == "game" then
    CheckGrid(xAndOs)
  end
end

function love.draw()
  Render(xAndOs)
end

function love.mousepressed(x, y, button, isTouch)
  if gameState == "game" then
    for row=1,3 do
      for column=1,3 do
        local blockX = xAndOs[row][column][2]
        local blockY = xAndOs[row][column][3]
        if CheckCollision(x, y, blockX,blockY, winW/3,winH/3) then
          local blockState = xAndOs[row][column][1]
          if blockState == ' ' then
            xAndOs[row][column][1] = currentState
            if currentState == 'O' then
              currentState = 'X'
            else
              currentState = 'O'
            end
          end
        end
      end
    end
  end
end
