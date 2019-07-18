# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #rows
  [0,1,2], 
  [3,4,5], 
  [6,7,8], 
  
  #columns
  [0,3,6], 
  [1,4,7], 
  [2,5,8], 
  
  #diagonals
  [0,4,8], 
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    won_x = win_combination.all? do |i|
      board[i] == "X"
    end
    
    won_o = win_combination.all? do |i|
      board[i] == "O"
    end
    
    if won_x || won_o
      return win_combination
    end
  end
  
  return false
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  win_combination = won?(board)
  if win_combination != false
    winner = board[win_combination[0]]
  end
end