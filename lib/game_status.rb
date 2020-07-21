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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |item|
    if board[item[0]] == "X" && board[item[1]] == "X" && board[item[2]] == "X"
      return item
    elsif board[item[0]] == "O" && board[item[1]] == "O" && board[item[2]] == "O"
      return item
    end
  end
  false
end

def full?(board)
  board.all? do |number|
    number=="X" or number=="O"
  end
end

def draw?(board)
  full?(board) and !won?(board)
end

def over?(board)
  won?(board) or full?(board) or draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]   # pick first index from winning combination
  end
end
