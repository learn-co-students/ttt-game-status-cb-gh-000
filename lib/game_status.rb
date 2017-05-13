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
  WIN_COMBINATIONS.each do |win_index|
    if board[win_index[0]] == "X" && board[win_index[1]] == "X" && board[win_index[2]] == "X"
      return win_index
    elsif board[win_index[0]] == "O" && board[win_index[1]] == "O" && board[win_index[2]] == "O"
      return win_index
    end
  end
  return false
end

def full?(board)
  board.each do |position|
    if position == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  winner = ""
  if won?(board)
    return board[won?(board)[0]]
  end
end