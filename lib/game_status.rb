# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def full?(board)
  return board.all? {|item| item == "X" || item == "O"}
end

def won?(board)
  WIN_COMBINATIONS.each do |wincomb|
    data = [board[wincomb[0]], board[wincomb[1]], board[wincomb[2]]]
    if data.uniq.size == 1 && (data[0] == "X" || data[0] == "O")
      return wincomb
    end
  end
  return false
end

def draw?(board)
  if won?(board)
    return false
  else
    return full?(board)
  end
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  win = won?(board)
  if win
    return board[win[0]]
  else
    return # nil
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # Horizontal
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  # Vertical
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],

  # Diagonal
  [0, 4, 8],
  [6, 4, 2]
]
