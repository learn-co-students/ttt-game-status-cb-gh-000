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
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if position_taken?(board, win_combo[0]) && position_taken?(board, win_combo[1]) && position_taken?(board,win_combo[1]) 
      if (board[win_combo[0]] == board[win_combo[1]]) && (board[win_combo[1]] == board[win_combo[2]])
        return win_combo
      end
    end
  end
  return nil
end

def full?(board)
  if (board.detect{|i| i ==" "} || board.detect{|i| i ==""}) == nil
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board)
    if won?(board)
      return false
    else
      return true
    end
  else
    return false
  end
end

def over?(board)
  if (draw?(board) || won?(board)) && full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  won = won?(board)
  if won != nil
    return board[won[0]]
  else return nil
  end

end