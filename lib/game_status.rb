# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [2, 5, 8],
  [1, 4, 7],
  [0, 3, 6],
  [6, 4, 2],
  [0, 4, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]] # load the value of the board at win_index_1
    position_2 = board[win_combination[1]] # load the value of the board at win_index_2
    position_3 = board[win_combination[2]] # load the value of the board at win_index_3
    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination # return the win_combination indexes that won.
    end
  end
  false
end

def full?(board)
  return board.all? {|items| items != " "}
end

def draw?(board)
  if !won?(board)
    return full?(board)
  end
  return false
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
