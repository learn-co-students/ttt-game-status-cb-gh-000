# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
]

def won?(board, key = 0, win = WIN_COMBINATIONS)
  win.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      if key == 1
        if position_1 == "X"
          return "X"
        else
          return "O"
        end
      else
        return win_combination # return the win_combination indexes that won.
      end
    end
  end
  return false
end

def full?(board)
  board.each do |_it|
    if _it != 'O' && _it != 'X'
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && !full?(board) == false
    return false
  elsif won?(board) != false
    return false
  end
end

def over?(board)
  if won?(board) != false
    return true # draw
  elsif won?(board) == false && full?(board) == true
    return true # won
  else
    return false # in progress
  end
end

def winner(board)
  if won?(board) != false
    res = won?(board, 1)
    return res
  else
    return nil
  end
end
