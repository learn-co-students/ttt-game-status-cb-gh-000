# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def check_win_combination?(board, player, win_combination)
  win_combination.all? do |position|
    board[position] == player
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end


def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end


def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if check_win_combination?(board, "X", win_combination)
      return win_combination
    elsif check_win_combination?(board, "O", win_combination)
      return win_combination
    end
  end
  return false
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
