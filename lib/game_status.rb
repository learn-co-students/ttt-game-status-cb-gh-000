# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #middle column
  [2,5,8], #last column
  [0,4,8], #primary diagonal
  [2,4,6]  #secondary diagonal
]

def won?(board)
  WIN_COMBINATIONS.find { |combination| (combination.all? { |index|
  position_taken?(board,index) && board[index] == "X"  }) || (combination.all? { |index|
  position_taken?(board,index) && board[index] == "O"  })
}
end

def full?(board)
  board.all? do |position|
    !(position.nil? || position == " ")
  end
end

def draw?(board)
  board.none? do |position|
    (position.nil? || position == " ") || won?(board)
  end
end

def over?(board)
   draw?(board) || won?(board)
end

def winner(board)
  over?(board) && won?(board) ? board[won?(board)[0]] : nil
end
