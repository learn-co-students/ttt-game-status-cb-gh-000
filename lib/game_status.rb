# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.find do |indexes|
    ["X", "O"].any? do |c|
      indexes.all?{|i| board[i]==c}
    end
  end
end

def full?(board)
  board.none?{|c| c == " "}
end

def draw?(board)
  full?(board) && won?(board) == nil
end

def over?(board)
  full?(board) || won?(board) != nil
end

def winner(board)
  board[won?(board)[0]] if won?(board) != nil
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
