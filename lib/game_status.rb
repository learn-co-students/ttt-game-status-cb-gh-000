# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
    if position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)
      return combination if combination.all? { |e| board[e] == "X"  }
      return combination if combination.all? { |e| board[e] == "O"  }
    end
  end
  return false
end

def full?(board)
  board.all? { |e| e == "X" || e == "O"  }
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if comb = won?(board)
    if comb.all? { |e| board[e] == "X" }
      return "X"
    elsif comb.all? { |e| board[e] == "O" }
      return "O"
    end
  else
    return nil
  end
end
