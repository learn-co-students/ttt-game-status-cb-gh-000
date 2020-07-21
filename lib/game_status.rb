# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom Row
  [0,3,6], # first Vertical
  [1,4,7], # Middle Vertical
  [2,5,8], # last  Vertical
  [6,4,2], # /
  [0,4,8]  # \
  # ETC, an array for each win combination
]



## determines if the game is over true if so
def over?(board)

    if won?(board) != false  || draw?(board) == true
      return true
    end

  return false
end
# draw determines if there is a draw
def draw? (board)
if full?(board) == true
  if won?(board) == false
    return true
  end
end
return false
end
## Determines with a board is full returns true if yes
def full?(board)
  counter = 0
  spaceCounter = 0
  until counter == 8
    if position_taken?(board, counter)
      spaceCounter += 1
    end
    counter += 1
  end
  if spaceCounter == 8
    return true
  else
    return false
  end
end
# Won method returns the winning array
def won? (board)
  WIN_COMBINATIONS.each do |row|
    if board[row[0]] == "X" && board[row[1]] == "X" && board[row[2]] == "X" || board[row[0]] == "O" && board[row[1]] == "O" && board[row[2]] == "O"
      return row
    end
  end
  return false
end

def winner(board)
  if won?(board) != false
    winArray = won?(board)
    return board[winArray[0]]
  end
end
