# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],  # top row
  [3, 4, 5],  # middle row
  [6, 7, 8],  # bottom row
  [0, 3, 6],  # left column
  [1, 4, 7],  # middle column
  [2, 5, 8],  # right column
  [0, 4, 8],  # left daigonal
  [6, 4, 2]   # right diagonal
]


def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? { |index| position_taken?(board, index) }
      if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
        return combination
      end
    end
  end
  return false
end


def full?(board)
  return board.all? { |position| position == "X" || position == "O"}
end


def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
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
  return won?(board) ? board[won?(board)[0]] : nil
end
