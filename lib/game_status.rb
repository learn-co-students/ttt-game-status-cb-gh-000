# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.any? do |e|
    if e.all? {|i| board[i] == "X"} || e.all? {|i| board[i] == "O"}
      return e
    end
  end
end

def full?(board)
  return board.all? {|e| e == "X" || e == "O"}
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  return won?(board) ? board[won?(board)[0]] : nil
end
