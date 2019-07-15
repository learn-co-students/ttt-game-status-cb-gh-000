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
  WIN_COMBINATIONS.each do |combination|
    if (board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X")
      return combination
    elsif (board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O")
      return combination
    end
  end
  return nil
end

def full?(board)
  board.each do |el|
    if(el == " ")
      return false
    end
  end
  return true
end

def draw?(board)
  if (full?(board) && !won?(board))
    return true
  elsif (!won?(board) && !full?(board))
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if(won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  win = won?(board)
  if(win == nil)
    return nil
  else
    return board[win[0]]
  end
end
