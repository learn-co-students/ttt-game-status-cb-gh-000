# Helper Method
  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # HORIZONTAL
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  # DIAGONAL
  [0, 4, 8],
  [2, 4, 6],
  # VERTICAL
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
    if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
      return combination
    elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
      return combination
    end
  end
  return false
end

def full?(board)
  full = true
  board.each_with_index do |square, i|
    if position_taken?(board, i) == false
      full = false
    end
  end
  full
end

def draw?(board)
  if full?(board) && won?(board) == false
    return true
  end
  false
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    grid = won?(board)
    board[grid[0]]
  end
end
