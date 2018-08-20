# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row
  [0,3,6],  #left columns
  [1,4,7],  #middle column
  [2,5,8], #right columns
  [0,4,8], #top-left to bottom-right diagnal
  [2,4,6] #top-right to bottom-left diagnal
]

def won?(board)
  for combination in WIN_COMBINATIONS
    if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && board[combination[2]] == board[combination[0]]
      if (board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X")
        return combination
      elsif (board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O")
        return combination
      end
    end
  end
  return false
end

def full?(board)
  return !board.include?(" ")
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !full?(board) || won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end

def winner(board)
  if (won?(board))
    return board[won?(board)[0]]
  end
  return nil
end
