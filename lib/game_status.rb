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
  WIN_COMBINATIONS.each do |combination|
    moves = [board[combination[0]], board[combination[1]], board[combination[2]]]
    if moves.all?{|move| (move == "X")} || moves.all?{|move| (move == "O")}
      return combination
    end
  end
  return false
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  # if the board is full and no win exists, then true
  return (full?(board) && !(won?(board)))
end

def over?(board)
  # if board won or is a draw or is full, returns true
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end  
  