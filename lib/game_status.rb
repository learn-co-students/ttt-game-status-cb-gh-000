# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if board[win_index_1] == 'X' && board[win_index_2] == 'X' && board[win_index_3] == 'X'
      return win_combination
    elsif board[win_index_1] == 'O' && board[win_index_2] == 'O' && board[win_index_3] == 'O'
      return win_combination
    end
  end
  false
end

def full?(board)
  board.none?{|i| i == " "}
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
  win_combination = won?(board)
  if !win_combination
    return nil
  end
  return board[win_combination[0]]
end
