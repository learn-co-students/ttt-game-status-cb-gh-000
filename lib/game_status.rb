# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
  ]
  
def won? (board)
  WIN_COMBINATIONS.find do |combination|
    position_taken?(board, combination[0]) && board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]
  end
end

def full? (board)
  (0...board.length).all? do |position|
    position_taken?(board, position)
  end
end

def draw? (board)
  !won?(board) && full?(board)
end

def over? (board)
  won?(board) || draw?(board)
end

def winner (board)
  board[won?(board)[0]] if won?(board)
end