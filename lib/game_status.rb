# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row win
  [3,4,5], # middle row win
  [6,7,8], # bottom row win
  [0,3,6], # first column win
  [1,4,7], # second column win
  [2,5,8], # third column win
  [0,4,8], # lefthand diagonal win
  [2,4,6]  # righthand diagonal win
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    # we will use the all? enumerator to return arrays of winning indexes
    # return winning index array if any of the winning positions on our board are all filled with "X"
    return win_combination if win_combination.all? {|position| board[position] == "X"}
    # here we are checking for possible winning situations for "O" and returning the winning array
    return win_combination if win_combination.all? {|position| board[position] == "O"}
  end
    return false if board.all? {|position| position != " "} # false for draw
    return false if board.all? {|position| position == " "} # false for empty board
  end

  def full?(board)
    return true if board.none? {|position_taken| position_taken == " "}
end

def draw?(board)
  return true unless won?(board)
end

def over?(board)
  return false unless won?(board) || full?(board)
  return true
end

def winner(board)
  return nil unless won?(board)
  return "X" if board[won?(board)[0]] == "X"
  return "O" if board[won?(board)[0]] == "O"
end
