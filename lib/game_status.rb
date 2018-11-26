# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
winner = ""
def full?(board)
  board.each do |cell|
    if(cell == " ")
      return false
    end
  end
  return true
end

def draw?(board)
  return full?(board) && !won?(board)
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")then
      winner = "X"
      return win_combination
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O") then
      winner = "O"
      return win_combination
    end
  end
  if !full?(board) then return false end
  return nil
end

def over?(board)
  if(won?(board) || draw?(board) || full?(board)) then
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")then
      return "X"
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O") then
      winner = "O"
      return "O"
    end
  end
  return nil
end
