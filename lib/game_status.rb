# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  i = 0
  while i < 9
    if board[WIN_COMBINATIONS[i][0]] == "X" and board[WIN_COMBINATIONS[i][1]] == "X" and board[WIN_COMBINATIONS[i][2]] == "X"
      return WIN_COMBINATIONS[i]
    elsif board[WIN_COMBINATIONS[i][0]] == "O" and board[WIN_COMBINATIONS[i][1]] == "O" and board[WIN_COMBINATIONS[i][2]] == "O"
      return WIN_COMBINATIONS[i]
    end
    i += 1
  end
rescue NoMethodError
  return false
end

# check whether it is full
def full?(board)
  return board.none?{|pos| pos == " " or pos == "" or pos == nil}
end

# check whether it can be drawn
def draw?(board)
  if not won?(board) and full?(board)
    return true
  elsif not won?(board) and not full?(board)
    return false
  else
    return false
  end
end

# check whether game over
def over?(board)
  if won?(board) or draw?(board) or full?(board)
    return true
  else
    return false
  end
end

# check winner
def winner(board)
  if over?(board)
    i = 0
    while i < 9
      if board[WIN_COMBINATIONS[i][0]] == "X" and board[WIN_COMBINATIONS[i][1]] == "X" and board[WIN_COMBINATIONS[i][2]] == "X"
        return "X"
      elsif board[WIN_COMBINATIONS[i][0]] == "O" and board[WIN_COMBINATIONS[i][1]] == "O" and board[WIN_COMBINATIONS[i][2]] == "O"
        return "O"
      end
      i += 1
    end
  end
end
