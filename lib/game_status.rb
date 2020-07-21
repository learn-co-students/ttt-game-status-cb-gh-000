# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    index1 = win_combination[0]
    index2 = win_combination[1]
    index3 = win_combination[2]

    if board[index1] == "X" && board[index2] == "X" && board[index3] == "X" || board[index1] == "O" && board[index2] == "O" && board[index3] == "O"
      return win_combination
    else
      false
    end
  end
  return false
end

def full?(board)
  board.all? do |item|
    item == "X" || item == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
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
  if item = won?(board)
    return board[item[0]]
end
