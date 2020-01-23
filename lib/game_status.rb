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
  [2,4,6]
]

#won?
def won?(board)

  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && board[win_index_1] != " "
       return win_combination
    end

  end

  return false

end

#full?
def full?(board)

  board.all? do |position|
    position == "X" || position == "O"
  end

end

#draw?
def draw?(board)
  full?(board) && !won?(board)
end

#over?
def over?(board)
  full?(board) || won?(board) || draw?(board)
end

#winner
def winner(board)

  index = []
  index = won?(board)

  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end

end
