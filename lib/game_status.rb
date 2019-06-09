# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
# 3 horizontal rows, 3 vertical columns, and 2 diagonals
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # 1st column
  [1,4,7], # 2nd column
  [2,5,8], # 3rd column
  [0,4,8], # Main axis Diagonal
  [2,4,6]  # Off axis diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect{|combination|
    (board.values_at(*combination).all?{|character| character=='X'} ||
     board.values_at(*combination).all?{|character| character=='O'})
   }
end

def full?(board)
  !board.any? do |position|
    position.strip == ""
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  (won?(board) || draw?(board) || full?(board))
end

def winner(board)
  obj = won?(board)
  if obj.respond_to?(:values_at)
    return board[obj[0]]
  end
end
