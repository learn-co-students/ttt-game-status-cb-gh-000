# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
#horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
#vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
#diagonal
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.any? do |indexes|
    if (indexes.all? {|position| board[position] == "X"} or indexes.all? {|position| board[position] == "O"})
      return indexes
    end
  end
end

def full?(board)
  board.all? { |e| e == "X" or e == "O"}
end

def draw?(board)
  (won?(board)) ? false : (full?(board)) ? true : false
end

def over?(board)
  (won?(board) or draw?(board) or full?(board))
end

def winner(board)

  if (!won?(board))
    return nil
  end
  
  ((won?(board)).all? { |idx| board[idx] == "X"}) ? "X" : (won?(board)).all? { |idx| board[idx] == "O"} ? "O" : nil
end
