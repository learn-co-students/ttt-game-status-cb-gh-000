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
  WIN_COMBINATIONS.any? do |combination|
    if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
      if board[combination[0]] == "X" || board[combination[0]] == "O"
        return combination
      end
    end
  end
end

def full?(board)
  board.all? { |e| e == "X" || e == "O" }

end

def draw?(board)
  won = won?(board)
  if won == false && full?(board)
      return true
  else
      return false
  end
end

def over?(board)
  won = won?(board)
  if won != false || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  won = won?(board)
  if won != false
    return board[won[0]]
  end
end
