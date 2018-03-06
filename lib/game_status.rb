# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Down row

  [0,3,6], #1st column
  [1,4,7], #2nd column
  [2,5,8], #3d column

  [0,4,8], #horizontal 1
  [2,4,6] #horizontal 1
]
def won?(board)
  a = []
  b = []
for i in 0..8 do
  if  board[i] == "X"
    a<<i
  elsif board[i] == "O"
    b<<i
  end
end

WIN_COMBINATIONS.each do |ar|
   if (ar - a).empty?
     return ar
   elsif (ar - b).empty?
     return ar
   end
  end
  return false
end

def full?(board)
  a = []
  b = []
  for i in 0..8 do
    if  board[i] == "X"
      a<<i
    elsif board[i] == "O"
      b<<i
    end
  end
  return true if (a + b).length == 9
  return false
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || !!won?(board)
end

def winner(board)
  x = won?(board)
  if !x
    return nil
  end
  board[won?(board)[0]]
end
