# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], #Bot Row
  [0,3,6], #left col
  [1,4,7], #mid col
  [2,5,8], #right col
  [0,4,8], #right diag
  [6,4,2]  #left diag
]

def won? (board)

  WIN_COMBINATIONS.each do |iter|
    winnerX = iter.all? do |posistion| board[posistion] == "X"  end
    winnerO = iter.all? do |posistion| board[posistion] == "O"  end
    if winnerX || winnerO
      puts iter
      return iter 
    end
  end
  return false
end

def full? (board)
  isFull = board.all? do |value| (value == "X" || value == "O") end
  if isFull
    return true
  end
  return false
end

def draw? (board)
  if full?(board) && !won?(board)
    return true
  end
  return false
end

def over? (board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
  return false
end

def winner (board)
  #champion = won?(board)
  if champion = won?(board) 
    return board[champion[0]]
  end
  return nil
end