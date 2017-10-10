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
  if board.select {| position | position == " "}.length == 9
    return false
  end

  WIN_COMBINATIONS.each { | combination |
    player = "X"

    2.times{
      if board[combination[0]] == player && board[combination[1]] == player && board[combination[2]] == player
        return combination
      end
      player = "O"
    }
  }
  return false
end

def full?(board)
  if board.select {| position | position == " "}.length == 0
    return true
  end
  false
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  WIN_COMBINATIONS.each { | combination |
    player = "X"

    2.times{
      if board[combination[0]] == player && board[combination[1]] == player && board[combination[2]] == player
        return player
      end
      player = "O"
    }
  }
  return nil
end
