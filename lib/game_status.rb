# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],  # Top Row
  [3, 4, 5],  # Mid Row
  [6, 7, 8],  # Bottom Row
  [0, 3, 6],  # Left Column
  [1, 4, 7],  # Mid Column
  [2, 5, 8],  # Right Colmun
  [0, 4, 8],  # First Diag
  [2, 4, 6]   # Second Diag
]

def won?(board)
  WIN_COMBINATIONS.each_with_index do |element, index|
    if position_taken?(board, element[0]) && board[element[0]] == board[element[1]] && board[element[0]] == board[element[2]]
      return WIN_COMBINATIONS[index]
    end
  end
    return false
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif won?(board)
    return false
  elsif !won?(board) && !full?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  won?(board) ? (return "#{board[won?(board)[0]]}") : ()
end
