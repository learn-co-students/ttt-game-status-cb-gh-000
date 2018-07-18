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
  x_won = false
  o_won = false
  WIN_COMBINATIONS.each do |combi|
    x_won = combi.all? { |e| board[e]=="X" }
    o_won = combi.all? { |e| board[e]=="O" }
    if x_won || o_won
      return combi
    end
  end
  return false
end

def full?(board)
  return !(board.any? { |e| e==" "})
end

def draw?(board)
  return full?(board) && !(won?(board))
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  result = won?(board)
  if result==false
    return nil
  end
  return board[result[0]]
end
