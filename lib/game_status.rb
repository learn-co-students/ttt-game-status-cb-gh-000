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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    pos1 = combo[0]
    pos2 = combo[1]
    pos3 = combo[2]

    el1 = board[pos1]
    el2 = board[pos2]
    el3 = board[pos3]

    if (el1 == "X" && el2 == "X" && el3 == "X")
      return combo
    elsif (el1 == "O" && el2 == "O" && el3 == "O")
      return combo
    else
      false
    end
  end
  false
end


def full?(board)
  board.each do |el|
    if (el == " ")
      return false
    end
  end
  return true
end

def draw?(board)
  return (!won?(board) && full?(board))
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    arr = won?(board)
    pos = arr[0]
    return board[pos]
  else
    return nil
  end
end
