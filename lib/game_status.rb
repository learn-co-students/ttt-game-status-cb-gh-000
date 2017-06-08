# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First col
  [1,4,7], # Second col
  [2,5,8], # Third col
  [0,4,8], # Diagonal from upper left
  [2,4,6], # Diagonal from upper right
]

def won?(board)
  WIN_COMBINATIONS.each do |comb|
    ind_one, ind_two, ind_three = comb
    if ["X", "O"].include?(board[ind_one]) &&
      (board[ind_one] == board[ind_two] && board[ind_two] == board[ind_three])
      return comb
    end
  end
  false
end

def full?(board)
  board.all? do |move|
    move == "X" || move == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  indexes = won?(board)
  if indexes
    return board[indexes[0]]
  end
end