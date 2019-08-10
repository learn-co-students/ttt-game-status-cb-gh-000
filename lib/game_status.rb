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
  [6,4,2],
]

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    (board[combo[0]] =="X" && board[combo[1]] =="X" && board[combo[2]]=="X") ||
    (board[combo[0]] =="O" && board[combo[1]] =="O" && board[combo[2]]=="O")
  end
end

def full?(board)
  board.none? { |spot| spot==" " }
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    #false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  if combo
    winner = board[combo[0]] == "X" ? "X" : "O"
  end
end
