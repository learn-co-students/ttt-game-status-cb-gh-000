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
  WIN_COMBINATIONS.each do |possibility|
    all_x = possibility.all? {|index| board[index] == 'X'}
    all_o = possibility.all? {|index| board[index] == 'O'}
    if all_x || all_o
      return possibility
    end
  end
  return false
end

def full?(board)
  board.all? {|cell| !(cell == " " || cell.nil?) }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]

puts winner(board)
