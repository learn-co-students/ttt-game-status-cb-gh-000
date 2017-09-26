# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # 8 possible ways to win: 3 horizontal rows, 3 vertical columns, and 2 diagonals
  [0, 1, 2], # horizontal top
  [3, 4, 5], # horizontal middle
  [6, 7, 8], # horizontal bottom
  [0, 3, 6], # vertical left
  [1, 4, 7], # vertical middle
  [2, 5, 8], # vertical right
  [0, 4, 8], # diagonal TL to BR
  [2, 4, 6]  # diagonal TR to BL
]


# return false/nil if no win combinations present in the board
# return winning combination indexes as an array if there is a win
def won?(board)
    WIN_COMBINATIONS.detect do |combination|
      # if all parts of a win combination are the same, i.e. X or O or blank
      board[combination[0]] == board[combination[1]] &&
      board[combination[1]] == board[combination[2]] &&
      # and they are not blank, thus X or O
      position_taken?(board, combination[0])
      # detect will return first winning combination and nil otherwise
    end
end

# return true if every element in the board contains either an "X" or an "O"
def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

# returns true if the board has not been won and is full
# returns false if the board is not won and the board is not full
# returns false if the board is won
def draw?(board)
  !won?(board) && full?(board)
end

# returns true if the board has been won, is a draw, or is full
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# return the token, "X" or "O" that has won the game given a winning board
# no ? on method name since this method does not return a boolean
def winner(board)
  # if there was a winning combination
  if won?(board)
    # get the first item in the winning combination (arbitrary) == all other items in the combination
    board[won?(board)[0]]
  end
end
