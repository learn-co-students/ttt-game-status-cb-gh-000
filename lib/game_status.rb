# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def empty?(board)
  eboard = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  if board == eboard
    return true
  end
end

def won?(board)
  if empty?(board)
    return false
  end

  for win_combination in WIN_COMBINATIONS
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    xwin = (position_1 == "X" && position_2 == "X" && position_3 == "X")
    owin = (position_1 == "O" && position_2 == "O" && position_3 == "O")
    win = (xwin || owin)
    if win
      return win_combination # return the win_combination indexes that won.
    elsif full?(board)
      return false
    end
  end
end

def full?(board)
  9.times do |index|
    if !position_taken?(board, index)
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board)
    return false
  end

  if full?(board)
    return true
  end

  if !won?(board) && !full?(board)
    return false
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  if full?(board) || !won?(board)
    return nil
  end
  win_combination = won?(board)
  b = board[win_combination[0]]
  if b == "X"
    return "X"
  elsif b == "O"
    return "O"
  else
    return nil
  end
end
