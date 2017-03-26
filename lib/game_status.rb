
board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8], #right column win
  [0,4,8], #left diagonal win
  [2,4,6]  #right diagonal win
]

def won?(board)

  if board[0] == "X" && board[1] == "X" && board[2] == "X"
    return WIN_COMBINATIONS[0] # return the win_combination indexes that won.
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    return WIN_COMBINATIONS[1] # return the win_combination indexes that won.
  elsif board[6] == "X" && board[7] == "X" && board[7] == "X"
    return WIN_COMBINATIONS[2] # return the win_combination indexes that won.
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    return WIN_COMBINATIONS[3] # return the win_combination indexes that won.
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    return WIN_COMBINATIONS[4] # return the win_combination indexes that won.
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[5] # return the win_combination indexes that won.
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
      return WIN_COMBINATIONS[6] # return the win_combination indexes that won.
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
        return WIN_COMBINATIONS[7] # return the win_combination indexes that won.
  else
    return false
  end
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)

  if  (!(board.include?(" "))) && (won?(board) == false)
    return true
  end
end

def over?(board)

  if won?(board)
    return true
  elsif full?(board)
    return true
  elsif draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
 winner_x = "X"
 winner_o = "O"
  if board[0] == "X" && board[1] == "X" && board[2] == "X"
    return winner_x # return the win_combination indexes that won.
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    return winner_x # return the win_combination indexes that won.
  elsif board[6] == "X" && board[7] == "X" && board[7] == "X"
    return winner_x # return the win_combination indexes that won.
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    return "O" # return the win_combination indexes that won.
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    return "O" # return the win_combination indexes that won.
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    return "O" # return the win_combination indexes that won.
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
      return winner_x # return the win_combination indexes that won.
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
      return "O" # return the win_combination indexes that won.
  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
      return "O" # return the win_combination indexes that won.
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
      return "O" # return the win_combination indexes that won.
  elsif board[6] == "O" && board[7] == "O" && board[7] == "O"
      return "O" # return the win_combination indexes that won.
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
      return winner_x # return the win_combination indexes that won.
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
      return winner_x # return the win_combination indexes that won.
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
      return winner_x # return the win_combination indexes that won.
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
      return "O" # return the win_combination indexes that won.
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
      return winner_x # return the win_combination indexes that won.
  else
      return nil
  end


end
