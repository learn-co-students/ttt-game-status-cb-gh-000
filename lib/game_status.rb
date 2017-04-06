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
  WIN_COMBINATIONS.each do |win|
    if position_taken?(board,win[0]) && position_taken?(board,win[1]) && position_taken?(board,win[2]) && board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]]
      return win
    end
  end
  return false
end

def full?(board)
  board.each do |player|
    if player != "X" && player != "O"
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  win = won?(board)
  if win != false
    return board[win[0]]
  end
end
