# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diagonal 1
  [2,4,6], # Diagonal 2
  [0,3,6], # Column 1
  [1,4,7], # Column 2
  [2,5,8]  # Column 3
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.detect do |arr_comb|
    board[arr_comb[0]]!=" " && board[arr_comb[0]]==board[arr_comb[1]] && board[arr_comb[0]]==board[arr_comb[2]]
  end
end

def full?(board)
  board.none? do |element|
    element == " "
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner (board)
  winner_combination = won?(board)
  puts winner_combination
  if winner_combination!= nil
    board[winner_combination[0]]
  end
end
