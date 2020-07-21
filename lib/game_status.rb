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
  WIN_COMBINATIONS.each do |combo|
    one = board[combo[0]]
    two = board[combo[1]]
    three = board[combo[2]]
    return combo if ((one == "X" && two == "X" && three == "X") || (one == "O" && two == "O" && three == "O"))
  end
  false
end

def full?(board)
  board.all? { |e|  e == "X" || e == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  combo ? board[combo[0]] : nil
end
