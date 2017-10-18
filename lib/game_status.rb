# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # row win
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  # column win
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  # diagonal win
  [0, 4, 8],
  [2, 4, 6]
]


# Define #won method
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|index| position_taken?(board, index) && board[index] == "X"}
      return combo
    elsif combo.all?{|index| position_taken?(board, index) && board[index] == "O"}
      return combo
    end
  end
  nil
end

# Define #full method
def full?(board)
  board.all?{|space| space == "X" || space == "O"}
end

# Define #draw method
def draw?(board)
  !won?(board) && full?(board)
end

# Define #over method
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# Define #winner method
def winner(board)
  combo = won?(board)
  if combo == nil
    nil
  else
    board[combo[0]]
  end
end
