# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |y|
    win_index_1 = y[0]
    win_index_2 = y[1]
    win_index_3 = y[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return y
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return y
    end
  end
  return nil
end

def full?(board)
  board.none? do |i|
    i == " "
  end
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) || full?(board) || draw?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if draw?(board)
    return nil
  end

  win_pos = won?(board)
  if !win_pos
    return nil
  end
  winner = board[win_pos[1]]
end
