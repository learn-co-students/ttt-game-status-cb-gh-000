# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # center column
  [2,5,8], # right column
  [0,4,8], # left diagonal
  [2,4,6] # right diagonal
]

# accepts a board and checks to see if the game has been won
def won?(board)
  WIN_COMBINATIONS.detect do | combination |
    combination.all? {|index| board[index] == "X"} || combination.all? {|index| board[index] == "O"}
  end # WIN_COMBINATIONS
end # #won?

# returns true if every element in the board contains an "X" or an "O"
def full?(board)
  board.all? {|pos| !(pos.nil? || pos == " ")}
end

# returns true if the board is full but has not been won
# returns false if the board has been won
def draw?(board)
  if won?(board)
    false
  else
    !won?(board) && full?(board)
  end
end

# returns true of the board has been won, is a draw or is full
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# if the game has been won, returns the winner
def winner(board)
  if over?(board) && won?(board)
    winning_row = won?(board)
    winner = board[winning_row[0]]
  else
    nil
  end
end
