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
  WIN_COMBINATIONS.each{|combo|
    if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
      return combo
    end
  }
  return false
end

def full?(board)
  board.each{|cell|
    if cell == " "
      return false
    end
  }
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end

  return false
end

def over?(board)
  if !draw?(board) && !won?(board) && !full?(board)
    return false
  end
  return true
end

def winner(board)
  wincomb = won?(board)
  if wincomb == false
    return nil
  else
    return board[wincomb[2]]
  end
end
