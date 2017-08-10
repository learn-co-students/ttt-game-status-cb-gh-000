# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row

  [0,3,6],  # left column
  [1,4,7],  # middle column
  [2,5,8], # right column

  [0,4,8],  # left diagonal
  [2,4,6]  # right diagonal
  #an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination| # for each win_combination in WIN_COMBINATIONS
    # for each nested array, get the 3 indeces
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    #check the value of those 3 indeces in the board array
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination # return the win_combination indexes that won.
    end
  end

  return false
end

def full?(board)
  full = true
  index = 0
  while index < 9
    full = position_taken?(board, index) #true if position is taken
    index += 1
  end
  full
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false #why doesn't over? method not seem to work??
      return nil
  end

  win = won?(board)
  i = win[0]

  if board[i] == "X"
    return "X"
  else
    return "O"
  end

end


  board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
  winner(board)
