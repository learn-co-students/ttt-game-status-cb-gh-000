# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  for combo in WIN_COMBINATIONS
    if [["X"]*3, ["O"]*3].include?([board[combo[0]], board[combo[1]], board[combo[2]]])
      return combo
    end
  end
  return nil
end

def full?(board)
  board.all? do |pos|
    pos != " "
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif (!won?(board) && !full?(board)) || won?(board)
    return false
  end
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  combo = won?(board)
  if !combo.nil?()
    return board[combo[0]]
  end
end
