function CheckGrid(xAndOs)
  local states = {}
  local fillCount = 0
  local currentPart = 1

  for row=1,3 do
    for column=1,3 do
      table.insert(states, xAndOs[row][column][1])
      if states[currentPart] ~= ' ' then
        fillCount = fillCount + 1
      end
      currentPart = currentPart + 1
    end
  end


  if (states[1] == 'O' and states[2] == 'O' and states[3] == 'O') or
     (states[4] == 'O' and states[5] == 'O' and states[6] == 'O') or
     (states[7] == 'O' and states[8] == 'O' and states[9] == 'O') or

     (states[1] == 'O' and states[4] == 'O' and states[7] == 'O') or
     (states[2] == 'O' and states[5] == 'O' and states[8] == 'O') or
     (states[3] == 'O' and states[6] == 'O' and states[9] == 'O') or

     (states[1] == 'O' and states[5] == 'O' and states[9] == 'O') or
     (states[3] == 'O' and states[5] == 'O' and states[6] == 'O') then
       winner = "O"
       gameState = "gameOver"

  elseif (states[1] == 'X' and states[2] == 'X' and states[3] == 'X') or
         (states[4] == 'X' and states[5] == 'X' and states[6] == 'X') or
         (states[7] == 'X' and states[8] == 'X' and states[9] == 'X') or

         (states[1] == 'X' and states[4] == 'X' and states[7] == 'X') or
         (states[2] == 'X' and states[5] == 'X' and states[8] == 'X') or
         (states[3] == 'X' and states[6] == 'X' and states[9] == 'X') or

         (states[1] == 'X' and states[5] == 'X' and states[9] == 'X') or
         (states[3] == 'X' and states[5] == 'X' and states[6] == 'X') then
           winner = "X"
           gameState = "gameOver"

  elseif fillCount == 9 then
    winner = "Tie"
    gameState = "gameOver"
  end

end
