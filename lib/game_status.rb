# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Middle row
  [0,3,6],  # Middle row
  [1,4,7],  # Middle row
  [2,5,8],  # Middle row
  [0,4,8],  # Middle row
  [6,4,2],  # Middle row
]

def won?(board)
  counter = -1
  until counter == WIN_COMBINATIONS.size - 1
    counter += 1
    if  board[WIN_COMBINATIONS[counter][0]] == "X" && board[WIN_COMBINATIONS[counter][1]] == "X" && board[WIN_COMBINATIONS[counter][2]] == "X" ||
      board[WIN_COMBINATIONS[counter][0]] == "O" && board[WIN_COMBINATIONS[counter][1]] == "O" && board[WIN_COMBINATIONS[counter][2]] == "O"
      return WIN_COMBINATIONS[counter] # return the win_combination indexes that won.
    end
  end
  return false
end

def full?(board)
  board.detect{|i| i == " "} == nil
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
