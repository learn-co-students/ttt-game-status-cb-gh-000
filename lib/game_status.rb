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
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && (board[combo[2]] == "O" || board[combo[2]] == "X"))
      return (combo)
    end
  end
  return (false)
end

def full?(board)
  all = board.select{|elem|  elem == "X" || elem == "O"}
  return (all.size == 9)
end

def draw?(board)
  if (full?(board) && !won?(board))
    return (true)
  else
    return (false)
  end
end

def over?(board)
  if (draw?(board) || won?(board))
    return (true)
  else
    return (false)
  end
end

def winner(board)
  combo = won?(board)
  if (combo)
    return (board[combo[0]])
  else
    return (nil)
  end
end
