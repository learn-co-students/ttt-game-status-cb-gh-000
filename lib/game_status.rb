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
  return false unless board.detect { |i| i != ' ' }

  WIN_COMBINATIONS.each do |win|
    places = [board[win[0]], board[win[1]], board[win[2]]]

    unless places.detect { |i| i == ' ' }
      return win if places.all? { |i| i == places[0] }
    end
  end

  false
end

def full?(board)
  board.none? { |i| i == ' ' }
end

def draw?(board)
  if full?(board)
    if won?(board)
      false
    else
      true
    end
  else
    false
  end
end

def over?(board)
  if full?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  win_type = won?(board)

  if win_type
    return board[win_type[0]]
  end

  nil
end
