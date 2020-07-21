# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row

  [0,3,6],
  [1,4,7],
  [2,5,8],

  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
]
def won?(board)
  win_index_1 = WIN_COMBINATIONS[0][0]
  win_index_2 = WIN_COMBINATIONS[0][1]
  win_index_3 = WIN_COMBINATIONS[0][2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  win_index_4 = WIN_COMBINATIONS[1][0]
  win_index_5 = WIN_COMBINATIONS[1][1]
  win_index_6 = WIN_COMBINATIONS[1][2]

  position_4 = board[win_index_4] # load the value of the board at win_index_4
  position_5 = board[win_index_5] # load the value of the board at win_index_5
  position_6 = board[win_index_6] # load the value of the board at win_index_6

  win_index_7 = WIN_COMBINATIONS[2][0]
  win_index_8 = WIN_COMBINATIONS[2][1]
  win_index_9 = WIN_COMBINATIONS[2][2]

  position_7 = board[win_index_7] # load the value of the board at win_index_1
  position_8 = board[win_index_8] # load the value of the board at win_index_2
  position_9 = board[win_index_9] # load the value of the board at win_index_3

  win_index_10 = WIN_COMBINATIONS[3][0]
  win_index_11 = WIN_COMBINATIONS[3][1]
  win_index_12 = WIN_COMBINATIONS[3][2]

  position_10 = board[win_index_10] # load the value of the board at win_index_4
  position_11 = board[win_index_11] # load the value of the board at win_index_5
  position_12 = board[win_index_12] # load the value of the board at win_index_6

  win_index_13 = WIN_COMBINATIONS[4][0]
  win_index_14 = WIN_COMBINATIONS[4][1]
  win_index_15 = WIN_COMBINATIONS[4][2]

  position_13 = board[win_index_13] # load the value of the board at win_index_1
  position_14 = board[win_index_14] # load the value of the board at win_index_2
  position_15 = board[win_index_15] # load the value of the board at win_index_3

  win_index_16 = WIN_COMBINATIONS[5][0]
  win_index_17 = WIN_COMBINATIONS[5][1]
  win_index_18 = WIN_COMBINATIONS[5][2]

  position_16 = board[win_index_16] # load the value of the board at win_index_4
  position_17 = board[win_index_17] # load the value of the board at win_index_5
  position_18 = board[win_index_18] # load the value of the board at win_index_6

  win_index_19 = WIN_COMBINATIONS[6][0]
  win_index_20 = WIN_COMBINATIONS[6][1]
  win_index_21 = WIN_COMBINATIONS[6][2]

  position_19 = board[win_index_19] # load the value of the board at win_index_1
  position_20 = board[win_index_20] # load the value of the board at win_index_2
  position_21 = board[win_index_21] # load the value of the board at win_index_3

  win_index_22 = WIN_COMBINATIONS[7][0]
  win_index_23 = WIN_COMBINATIONS[7][1]
  win_index_24 = WIN_COMBINATIONS[7][2]

  position_22 = board[win_index_22] # load the value of the board at win_index_4
  position_23 = board[win_index_23] # load the value of the board at win_index_5
  position_24 = board[win_index_24] # load the value of the board at win_index_6

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return WIN_COMBINATIONS[0] # return the win_combination indexes that won.
  elsif position_4 == "X" && position_5 == "X" && position_6 == "X"
    return WIN_COMBINATIONS[1] # return the win_combination indexes that won.

  elsif position_7 == "X" && position_8 == "X" && position_9 == "X"
    return WIN_COMBINATIONS[2] # return the win_combination indexes that won.
  elsif position_10 == "X" && position_11 == "X" && position_12 == "X"
    return WIN_COMBINATIONS[3] # return the win_combination indexes that won.

  elsif position_13 == "X" && position_14 == "X" && position_15 == "X"
    return WIN_COMBINATIONS[4] # return the win_combination indexes that won.
  elsif position_16 == "X" && position_17 == "X" && position_18 == "X"
    return WIN_COMBINATIONS[5] # return the win_combination indexes that won.

  elsif position_19 == "X" && position_20 == "X" && position_21 == "X"
    return WIN_COMBINATIONS[6] # return the win_combination indexes that won.
  elsif position_22 == "X" && position_23 == "X" && position_24 == "X"
    return WIN_COMBINATIONS[7] # return the win_combination indexes that won.

  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return WIN_COMBINATIONS[0] # return the win_combination indexes that won.
  elsif position_4 == "O" && position_5 == "O" && position_6 == "O"
    return WIN_COMBINATIONS[1] # return the win_combination indexes that won.

  elsif position_7 == "O" && position_8 == "O" && position_9 == "O"
    return WIN_COMBINATIONS[2] # return the win_combination indexes that won.
  elsif position_10 == "O" && position_11 == "O" && position_12 == "O"
    return WIN_COMBINATIONS[3] # return the win_combination indexes that won.

  elsif position_13 == "O" && position_14 == "O" && position_15 == "O"
    return WIN_COMBINATIONS[4] # return the win_combination indexes that won.
  elsif position_16 == "O" && position_17 == "O" && position_18 == "O"
    return WIN_COMBINATIONS[5] # return the win_combination indexes that won.

  elsif position_19 == "O" && position_20 == "O" && position_21 == "O"
    return WIN_COMBINATIONS[6] # return the win_combination indexes that won.
  elsif position_22 == "O" && position_23 == "O" && position_24 == "O"
    return WIN_COMBINATIONS[7] # return the win_combination indexes that won.
  else
    false
  end
end

def full?(board)
  board.all? do |element|
    element.to_s == "X" or element.to_s == "O"
  end
end
def draw?(board)
  if((full?(board) ==  true) && (won?(board) == false))
    true
  elsif
    ((full?(board) ==  false) && (won?(board) == false))
    true
  elsif won?(board) != false
    false
  end
end
def over?(board)
  if ((full?(board) == true))
    true
  elsif((full?(board) == false)) && winner(board) == nil
    false
  elsif (((winner(board) == "X") || (winner(board) == "O")) && (full?(board) == false))
    true
  else
    false
  end
end
def winner(board)
  answer = won?(board)
  if(answer != false)
    index = answer[0]
    if (board[index] == "O")
      return "O"
    elsif (board[index] == "X")
      return "X"
    end
  elsif ((draw?(board) == false) || (draw?(board) == true))
    return nil
  end
end
