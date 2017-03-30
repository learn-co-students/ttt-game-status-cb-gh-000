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
  combination = 0
  win = 0
  while combination < 8
    if board[WIN_COMBINATIONS[combination][0]] == "X" && board[WIN_COMBINATIONS[combination][1]] == "X" && board[WIN_COMBINATIONS[combination][2]] == "X" || board[WIN_COMBINATIONS[combination][0]] == "O" && board[WIN_COMBINATIONS[combination][1]] == "O" && board[WIN_COMBINATIONS[combination][2]] == "O"
      win = 1
      return [WIN_COMBINATIONS[combination][0],WIN_COMBINATIONS[combination][1],WIN_COMBINATIONS[combination][2]]
    end
    combination += 1
  end
  if win == 0
    return false
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  return !(won?(board)) && full?(board)
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board).class == Array
    return board[won?(board)[0]]
  else
    return nil
  end
end
