# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Right diagonal
  [2,4,6], # Left diagonal
  [0,3,6], # Left column
  [1,4,7], # Center column
  [2,5,8]  # Right column
]

def won?(board)
  res = nil
  WIN_COMBINATIONS.each do |combination|
    winX=combination.all? do |index|
      board[index].eql?("X")
    end
    winO=combination.all? do |index|
      board[index].eql?("O")
    end

    if winX==true || winO==true
      res = combination
    end

  end

  return res
end

def full?(board)
  !board.any? do |var|
    var.eql?(" ")
  end
end

def draw?(board)
  if full?(board)==true and won?(board)==nil
    return true
  end

  return false
end

def over?(board)
  full?(board)
end

def winner(board)
  player=won?(board)

  if player == nil
    return nil
  else
    board[player[0]]
  end
end
