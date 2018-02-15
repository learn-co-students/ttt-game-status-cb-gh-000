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
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.find do |i|
    board[i[0]] == board[i[1]] && board[i[0]] == board[i[2]] && position_taken?(board, i[1])
  end
end

def full?(board)
  if board.any? { |e| e == '' || e == ' ' || e == nil }
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    won_token = won?(board)
    return board[won_token[0]]
  else
    return nil
  end
end
