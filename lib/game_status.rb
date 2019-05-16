# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
def won? (board)
#  for each win_combination in
    WIN_COMBINATIONS.each do |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winner = "O"
      return win_combination # return the win_combination indexes that won.
    else
      false
    end
  end
end
def full? (board)
  counter = 0;
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1;
    else
      false
    end
  end
  if counter == 9
    return true
  else
    return false
  end
end
def  draw? (board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end
def  over?(board)
  if win?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end
def  winner(board)
  winner = "X"
  if won?(board)
    return winner
  else
    false
  end
end
