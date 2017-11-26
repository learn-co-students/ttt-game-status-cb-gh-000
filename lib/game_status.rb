# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
WIN_COMBINATIONS = [
  [0, 1, 2], # Top Row
  [3, 4, 5], # Middle Row
  [6, 7, 8], # Bottom Row
  [0, 3, 6], # Left Column
  [1, 4, 7], # Middle Column
  [2, 5, 8], # Right Column
  [6, 4, 2], # Left Diagonal
  [8, 4, 0]  # Right Diagonal
]
def won?(board)
  if board[WIN_COMBINATIONS[0]] == "X" || board[WIN_COMBINATIONS[0]] == "O"
    puts "Somebody won with top row!"
    return true
  elsif board[WIN_COMBINATIONS[1]] == "X" || board[WIN_COMBINATIONS[1]] == "O"
    puts "Somebody won with middle row!"
    return true
  elsif board[WIN_COMBINATIONS[2]] == "X" || board[WIN_COMBINATIONS[2]] == "O"
    puts "Somebody won with bottom row!"
    return true
  elsif board[WIN_COMBINATIONS[3]] == "X" || board[WIN_COMBINATIONS[3]] == "O"
    puts "Somebody won with left column!"
    return true
  elsif board[WIN_COMBINATIONS[4]] == "X" || board[WIN_COMBINATIONS[4]] == "O"
    puts "Somebody won with middle column!"
    return true
  elsif board[WIN_COMBINATIONS[5]] == "X" || board[WIN_COMBINATIONS[5]] == "O"
    puts "Somebody won with right column!"
    return true
  elsif board[WIN_COMBINATIONS[6]] == "X" || board[WIN_COMBINATIONS[6]] == "O"
    puts "Somebody won with left diagonal!"
    return true
  elsif board[WIN_COMBINATIONS[7]] == "X" || board[WIN_COMBINATIONS[7]] == "O"
    puts "Somebody won with right diagonal!"
    return true
  else
    return false
  end
end

def full?(board)
  if won?(board)
    return false
  end
end
