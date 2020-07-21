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

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
     position_taken?(board, combination[0]) &&
     combination.all? { |val| board[val] == board[combination[0]] }
  end
end

def full?(board)
  board.none? { |val| val == " " || val == ""}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  res = won?(board)
  res ? board[res[0]] : res
end
