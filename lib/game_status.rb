# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[1,4,7],[0,3,6],[5,2,8],[0,4,8],[2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |element|
    element.all? {|x| board[x] == "X"} or element.all? {|o| board[o] == "O"}
  end
end

def full?(board)
  board.all? do |ind|
    !(ind.nil? || ind == " ")
  end
end

def draw?(board)
  full?(board) and !won?(board)
end

def over?(board)
  full?(board) or won?(board) or draw?(board)
end

def winner(board)
  x = won?(board)
  if x
    if x.all? {|a| board[a] == "X"}
      "X"
    elsif x.all? {|a| board[a] == "O"}
      "O"
    end
  else
    nil
  end
end
