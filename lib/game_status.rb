# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.find do |combination|
    win_index1 = combination[0]
    win_index2 = combination[1]
    win_index3 = combination[2]
    pos1 = board[win_index1]
    pos2 = board[win_index2]
    pos3 = board[win_index3]
    if pos1 == "X" && pos2 == "X" && pos3 == "X" || pos1 == "O" && pos2 == "O" && pos3 == "O"
      return combination
    else
      false
    end
  end
end

def full?(board)
  i = 0
  while i < 9
    if !position_taken?(board, i)
      return false
    end
    i += 1
  end
  return true
end


def draw?(board)
  if won?(board)
    return false
  elsif !won?(board) && !full?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    combination = won?(board)
    index = combination[0]
    position = board[index]
    if position == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end
