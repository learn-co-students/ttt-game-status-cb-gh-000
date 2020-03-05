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
  if board.all?{|position| position == " "}
    return false
  end

  WIN_COMBINATIONS.each do |combinations|
    if combinations.all?{|position| board[position] == "X"} ||
      combinations.all?{|position| board[position] == "O"}
      return combinations
    end
  end

  return false
end

def full?(board)
  if draw?(board)
    return true
  end

  if !board.any?{|position| position == " "} &&
    !won?(board)
     return true
  end
end

def draw?(board)
  if board.all?{|position| position == " "}
    return true
  end

  if !won?(board) &&
     board.all?{|position| position == "X" || position == "O"}
    return true
  end

  return false
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end

    return false
end

def winner(board)
  if !won?(board)
    return nil
  end

  if won?(board).all?{|position| board[position] == "X"}
    return "X"
  end

  if won?(board).all?{|position| board[position] == "O"}
    return "O"
  end
end
