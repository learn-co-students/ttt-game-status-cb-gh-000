# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Vertical Left
  [1, 4, 7], # Vertical Middle
  [2, 5, 8], # Vertical right
  [0, 4, 8], # Top left to bottom right
  [2, 4, 6] # Top right to bottom left
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def draw?(board)
  !won?(board) && board.all?{|token| token == "X" || token == "O"}
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def over?(board)
  won?(board) || full?(board)
end
