# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  a = WIN_COMBINATIONS.find do |combination|
    (board[combination[0]] == "X" || board[combination[0]] == "O") && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
  end
  #c = WIN_COMBINATIONS[0]
  #puts board[c[0]]
  return a
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

bo = ["X", " ", "O", "X", " ", "O", " ", " ", "O"]
a = won?(bo)
puts a

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if draw?(board)
    nil
  elsif won?(board)
    a = won?(board)
    board[a[0]]
  end
end
