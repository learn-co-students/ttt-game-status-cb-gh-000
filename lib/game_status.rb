# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5], #Horizotol combinations
  [6,7,8],
  [0,3,6],
  [1,4,7], #Vertical combinations
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?(board)
  board.each do |pos|
    if pos == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board) == false and full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) or won?(board) or draw?(board)
    return true
  else
    return false
  end
end

def winner (board)
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

board = ["X", "O", "X", "O", "X", "O", "O", "O", "O"]
puts winner(board)
