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
  [2,4,6],
]

def comb_won?(board, comb)
  comb.all?{|i| board[i] == "O"} || comb.all?{|i| board[i] == "X"}
end

def won?(board)
  won = false
  WIN_COMBINATIONS.each do |comb|
    if comb_won?(board, comb)
      won = true
      return comb
    end
  end
  if !won
    return nil
  end
end

def full?(board)
  board.all?{|i| i == "O" || i == "X"}
end

def draw?(board)
  if !won?(board) and full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  won = won?(board)
  if won
    return board[won[0]]
  else
    return nil
  end
end
