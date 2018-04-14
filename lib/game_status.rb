# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |arr|
    temp = []
    arr.each {|i| temp << board[i]}
    result = temp.join
    if result == "XXX" || result == "OOO"
      return arr
    end
  end
  return false
end

def full?(board)
  board.all? {|x| x == "O" || x == "X"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || full?(board)
end

def winner(board)
  result = won?(board)
  board[result[0]] unless result == false
end
