# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
[0,1,2],
[3,4,5],
[6,7,8],
[0,4,8],
[2,4,6],
[0,3,6],
[2,5,8],
[1,4,7]
]


def won?(board)
  WIN_COMBINATIONS.each { |e|
    if board[e[0]] == board[e[1]] && board[e[0]] == board[e[2]] && board[e[0]] != " "
      return e
    else
    false
    end
   }
   return false
end

def full?(board)
  board.all? { |e|
    e == "X" || e == "O"
   }
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board)
    return true
  end
  return false
end

def winner(board)
  if won?(board)
    win_combo=won?(board)
    return board[win_combo[0]]
  end
  return nil
end
