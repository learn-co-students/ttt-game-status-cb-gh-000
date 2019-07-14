# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2],#horizontal
  [3,4,5],
  [6,7,8],
  [0,3,6], #vertical
  [1,4,7],
  [2,5,8],
  [0,4,8], #diagonals
  [2,4,6]
]
def won?(board)

  if !board.include?("X") && !board.include?("Y")
    return false
  end
  winner = Array.new

  WIN_COMBINATIONS.each{|combination|
    x_wins = board[combination[0]].strip == "X" && board[combination[1]].strip == "X" && board[combination[2]].strip == "X"
    y_wins = board[combination[0]].strip == "O" && board[combination[1]].strip == "O" && board[combination[2]].strip == "O"

    if x_wins || y_wins
      winner = combination
    end

  }
  if winner.empty?
    return false
  else
    return winner
  end
end
def full?(board)
  !board.include?(" ")

end
def draw?(board)
  full?(board) && !won?(board)
end
def over?(board)
  won?(board) || draw?(board) || full?(board)
end
def winner(board)

   row = won?(board)

   if row == false
     return nil
  else
    return board[row[0]]
  end
end
