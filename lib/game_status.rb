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
  WIN_COMBINATIONS.each do |combination|
    return combination if combination.all? { |val| board[val] == 'X' }
    return combination if combination.all? { |val| board[val] == 'O' }
  end
  nil
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
