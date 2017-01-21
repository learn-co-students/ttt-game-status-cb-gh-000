# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
EMPTY_BOARD = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all? { |index| board[index] == "X" }
      return combo
    elsif combo.all? { |index| board[index] == "O" }
      return combo
    end
  end
  return false
end

def full?(board)
  if board.all? { |char| char != " " }
    if !won?(board)
      return true
    end
  end
  return false
end

def draw?(board)
  if full?(board)
    return true
  end
  return false
end

def over?(board)
  return draw?(board) || (won?(board) != false) || false
end

def winner(board)
  if draw?(board)
    return nil
  end

  if won?(board) == false
    return nil
  end
  
  return board[won?(board)[0]]
end
