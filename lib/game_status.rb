# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = ["X", "O", "X", "O", "X", "O", "X", "X", "O"]

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [2,4,6], #right to left diagonal
  [0,4,8], #left to right diagonal
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8] #third column
]
def won?(board)
  index = []
  WIN_COMBINATIONS.each do |combo|
    combo.each do |pos|
      index.push(board[pos])
     end
    if index == ["X", "X", "X"] || index == ["O", "O", "O"]
     return combo
    else
     index.clear
    end
  end
  return false
end






def full?(board)
  board.all? {|pos| pos == "X" || pos == "O"}
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
end

def over?(board)
  if won?(board)
    return true
  elsif full?(board)
    return true
  elsif draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    index = won?(board)
    if board[index[0]] == "X"
      return "X"
    elsif board[index[0]] == "O"
      return "O"
    else
      return false
    end
  end
end
