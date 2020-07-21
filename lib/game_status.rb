# Helper Method
def place_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# 0 1 2
# 3 4 5
# 6 7 8

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top horizontal
  [3,4,5], # Middle horizontal
  [6,7,8], # Bottom horizontal
  [0,3,6], # Left vertical
  [1,4,7], # Center vertical
  [2,5,8], # Right vertical

  [0,4,8], # LT to RB diagonal
  [2,4,6] # RT to LB diagonal
]

def check?(board, player, combo)
  combo.all? do |place|
    board[place] == player
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo| # for each item in the win combinations
    if check?(board, 'X', combo)
      return combo
    elsif check?(board, 'O', combo)
      return combo
    end
  end
    return false
end

def full?(board)
  if board.include?(' ') || board.include?('')
    return false
  else
    return true
  end
end

def draw?(board)
 if !won?(board) && full?(board)
   return true
 end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board) # accepts a board and returns a token
  if !won?(board)
    return nil
  else WIN_COMBINATIONS.each do |combo|
    if check?(board, 'X', combo)
      return 'X'
    elsif check?(board, 'O', combo)
      return 'O'
    end
  end
end
end
