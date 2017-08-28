# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

# Array -> Array
# Determines if the game is won be any of the players

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if ((board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X") || (board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"))
      return combination
    end
  end
  nil
end

# Array -> Boolean
# Returns True if the board array is full, false otherwise

def full?(board)
  board.none? do |cell|
    cell == " "
  end
end

# Array -> Boolean
# Returns true if the board has not been won and is full and false if the board is not won and the board is not full

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

# Array -> Boolean
# Determines if the game is over

def over?(board)
  if  won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

# Array -> String
# Returns the winner of the game if there is one

def winner (board)
  if won? (board)
    return board[won?(board)[0]]
  else
    nil
  end
end
