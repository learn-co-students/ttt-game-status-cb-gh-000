# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.find do |comb|
     board[comb[0]] == board[comb[1]] && board[comb[1]] == board[comb[2]] && position_taken?(board, comb[0])
   end
end

def full?(board)
  board.all?{ |cell| cell == 'X' || cell == 'O'}
end

def draw?(board)
  !won?(board) && full?(board)
  # !won?(board) && !full?(board) || won?
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
   board[won?(board).first] if won?(board)
end
