# Helper Method
board = ["O", "O", " ", "X", "X", "X", " ", " ", " "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #across combinations
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row

  #up/down combinations
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column

  #diagonal combinations
  [0, 4, 8], #diagonal topleft/bottomright
  [2, 4, 6] #diagonal bottomleft/topright

]

def won?(board) #accept board argument and return true for win & false if no win yet. if there is a win will return winning combo indexes as an array.
  WIN_COMBINATIONS.each do |win_combination|
    if position_taken?(board, win_combination[0]) && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
      return win_combination
    end
  end
  return false
end

def full?(board)
  !board.any? do |free|
    free == " "
  end
end

def draw?(board) #returns true if the board has not been won but is full, false if the board hasn't been won and the board is free, and false if the board has been won.
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board) #returns true if game has been won, is a draw, or is full
  if draw?(board) #game drawn/full
    true
  elsif !won?(board) == false #game won
    true
  end
end

def winner(board)
  win = won?(board)
  if win
    board[win[0]]
  else
    nil
  end
end
