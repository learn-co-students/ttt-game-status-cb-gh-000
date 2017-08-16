# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  won = nil
  WIN_COMBINATIONS.each do |x|
    if board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X"
      won = x
    elsif board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"

      won = x
    end
  end
  return won
end

def full?(board)
  full = false
  x = 0
  counter = 0
  while counter < 10
  if position_taken?(board, x) == true
    x += 1
    counter += 1
  else
    counter +=1
  end
  end
  if x == 9
    full = true
  end
  return full
end

def draw?(board)
  draw = false
  if won?(board) == nil && full?(board) == true
    draw = true
  end
  return draw
end

def over?(board)
  over = false
  if draw?(board) == true || won?(board) != nil
    over = true
  end
  return over
end

def winner(board)
  won = nil
  WIN_COMBINATIONS.each do |x|
    if board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X"
      won = "X"
    elsif board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"
      won = "O"
    end
  end
  return won
end
