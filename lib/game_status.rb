# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # First row
  [3, 4, 5], # Second row
  [6, 7, 8], # Third row
  [0, 3, 6], # First column
  [1, 4, 7], # Second column
  [2, 5, 8], # Third column
  [0, 4, 8], # Top-left to bottom-right diagonal
  [2, 4, 6]  # Top-right to bottom-left diagonal
]

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
    position_1 = win_combination[0]
    position_2 = win_combination[1]
    position_3 = win_combination[2]

    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_combination
    end

    if board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_combination
    end

  end

  false
end

def full?(board)
  index = 0

  while index < board.size
    if position_taken?(board, index)
      index += 1
    else
      return false
    end
  end

  true
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  win_combination = won?(board)

  win_combination ? board[win_combination[0]] : nil
end
