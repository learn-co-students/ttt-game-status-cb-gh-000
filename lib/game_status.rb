# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #mid row
  [6,7,8], #bot row
  [0,3,6], #left col
  [1,4,7], #mid col
  [2,5,8], #right col
  [6,4,2], #back anti-diag
  [8,4,0]  #forward anti-diag
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|index| board[index] == "X"}
      return combo
    elsif combo.all?{|index| board[index] == "O"}
      return combo
    end
  end
  return false
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

def full?(board)
  return board.all? { |e| e == "X" || e == "O" }
end

def draw?(board)
  return full?(board) && !(won?(board))
end

def over?(board)
  return full?(board) || won?(board) || draw?(board)
end
