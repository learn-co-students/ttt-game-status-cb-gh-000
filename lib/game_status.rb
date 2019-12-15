# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6],
  [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each { |e|
    if (board[e[0]] =="X"&& board[e[1]] =="X"&& board[e[2]] == "X") || (board[e[0]] =="O"&& board[e[1]] =="O"&& board[e[2]] == "O")
      return e
    end
  }
  return nil
end

def full?(board)
  board.all? { |e| e=="X" || e=="O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  won?(board) == nil ? nil : board[won?(board)[0]]
end
x=true
puts won?(["X", "O", " ", " ", "X", " ", " ", "O", "X"])
puts x
