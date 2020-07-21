# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      return combination
    end
    if board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      return combination
    end
  end
  return false
end

def full?(board)
  board.each do |elem|
    return false if elem == " "
  end
  return true
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  win_status = won?(board)
  if win_status
    return board[win_status[0]]
  else return nil
  end
end
