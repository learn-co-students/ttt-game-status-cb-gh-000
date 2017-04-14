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
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if win.all? { |field|  board[field] == "X"}
      return win
    end
    if win.all? { |field|  board[field] == "O"}
      return win
    end
  end
  return nil
end

def full?(board)
  return board.all? { |field|  ['X', 'O'].include?(field)}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  fields = won?(board)
  if !fields
    return nil
  end
  return board[fields[0]]
end
