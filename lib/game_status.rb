# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    combination_x = combination.select do |index|
      board[index] == "X"
    end
    if combination_x.size == 3
      return combination_x
    end
    combination_o = combination.select do |index|
      board[index] == "O"
    end
    if combination_o.size == 3
      return combination_o
    end
  end
  return false
end

def full?(board)
  board.all? do |field|
    field == "X" || field == "O"
  end
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if !won?(board)
    return nil
  end
  return board[won?(board)[0]]
end
