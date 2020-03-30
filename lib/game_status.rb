# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    if x.all?{|y| board[y]=="X"} || x.all?{|y| board[y]=="O"}
      return x
    end
  end
  return false
end

def full?(board)
  board.all?{|x| x!=" "}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    x=won?(board)
    return board[x[0]]
  else
    return nil
  end
end