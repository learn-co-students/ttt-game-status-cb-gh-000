# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |val|

    if board[val[0]] == "X" && board[val[1]] == "X" && board[val[2]] == "X"
      return val
    end
    if board[val[0]] == "O" && board[val[1]] == "O" && board[val[2]] == "O"
      return val
    end
  end
  if full?(board)
    return false
  end
  if board == [" "," "," "," "," "," "," "," "," "]
    return false
  end
end

def full?(board)
  full_board = true
  board.each do |val|
    if val.nil? || val == " "
      full_board = false
    end
  end
  return full_board
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board [won?(board)[1]]
  else
    return nil
  end
end
