# Helper Method that detects if a position has already been taken.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Constant provides a nested array of all possible combinations
# that would win the game of Tic Tac Toe.
WIN_COMBINATIONS = [
  [0,1,2],  # Top    Row
  [3,4,5],  # Middle Row
  [6,7,8],  # Bottom Row

  [0,3,6],  # Left   Column
  [1,4,7],  # Center Column
  [2,5,8],  # Right  Column

  [0,4,8],  # Left   Diagonal
  [2,4,6]   # Right  Diagonal
]

# Method that goes through each possible array combination within
# the board and compares it with all possible win combinations and
# declares the game won if a combination is found.
def won?(board)
  # for each win_combo in WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |win_combo|
    # win_combination is a 3 element array of indexes that compose a win, eg. [0,1,2]
    # grab each index from the win_combo that composes a win.
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    # If/else that declares a winner if all three spots in a winning array have
    # either an "X" or an "O", respectively.
    if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
      return win_combo
    elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
      return win_combo
    end
  end
  return false
end

# Method that goes through the board's array searching for an empty position,
# if none are found, it will return true.
def full?(board)
  index = 0
  while index < 9
    index += 1
    if board[index] == " "
      return false
    else
      return true
    end
  end
end

# Method that returns true if the board has not been won and is full,
# false if the board is not won and the board is not full,
# and false if the board is won.
def draw?(board)
  won = won?(board)
  full = full?(board)
  if won == false && full == true
    return true
  elsif won == false && full == false
    return false
  end
end

# Method that checks if the game is over by checking the return values
# of the won? and draw? method to see whether they're true or false.
def over?(board)
  won = won?(board)
  draw = draw?(board)
  # Due to the won? method never explicitly returning a true value,
  # the program must instead check if it isn't false.
  if draw == true || won != false
    return true
  else
    return false
  end
end

# Method that declares the winner of the game by checking the token
# value of the won? method. Returns nil if there is no winner (yet).
def winner(board)
  won = won?(board)
  if won != false
    if board[won[0]] == "X"
      return "X"
    elsif board[won[0]] == "O"
      return "O"
    end
  else
    return nil
  end
end
