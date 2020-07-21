# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # H1
  [3,4,5], # H2
  [6,7,8], # H3
  [0,3,6], # V1
  [1,4,7], # V2
  [2,5,8], # V3
  [0,4,8], # D1
  [6,4,2]  # D2
]

def won?(board)
  # Iterate through win condition array for X and O
  WIN_COMBINATIONS.each do |win_combination|
    # For each potential win combination, iterate and check if
    # all indices of combination are filled by all X or all O
    winning_x = win_combination.all? do |index|
      board[index].include?("X")
    end
    winning_o = win_combination.all? do |index|
      board[index].include?("O")
    end
    # Return winning combination from array as soon as matching
    # X or O combination is found
    if winning_x
      return win_combination
    elsif winning_o
      return win_combination
    end
  end
  # If no win conditions are met, return false
  false
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  (!won?(board) && full?(board))
end

def over?(board)
  won?(board)
  draw?(board)
  full?(board)
end

def winner(board)
  winning_combo = won?(board)
  if won?(board)
     board[winning_combo[0]]
  end
end
