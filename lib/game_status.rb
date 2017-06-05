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
  WIN_COMBINATIONS.each do |combo|
    if ( (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O") )
      return combo
    end
  end
  return false
end

def full?(board)
  counter = -1
  board.all? do |val|
    counter += 1
    position_taken?(board, counter)
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end
