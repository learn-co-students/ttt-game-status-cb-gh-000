# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
WIN_COMBINATIONS= [[0,3,6],[0,1,2],[3,4,5],[6,7,8],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
# Define your WIN_COMBINATIONS constant
def won?(board)
  tanda=0
  WIN_COMBINATIONS.each do |ok|
    if board[ok[0]]== "X" && board[ok[1]]== "X" && board[ok[2]]=="X"
      tanda=2
      return ok
    elsif board[ok[0]]== "O" && board[ok[1]]== "O" && board[ok[2]]=="O"
      tanda=2
      return ok
    end
  end
  if tanda==0
    return false
  end
end

def full?(board)
  cek=0
  board.each do |bo|
    if bo==" "
      cek=1
    end
  end
  if cek==0
    return true
  else 
    return false
  end
end

def draw?(board)
  as=won?(board)
  az=full?(board)
  if az==true && as==false
    return true
  end
end
def over?(board)
  isWon=won?(board)
  isDraw=draw?(board)
  isFull=full?(board)
  if isDraw==true
    return true
  end
  if isWon==false
    ada="ada"
  else
    return true
  end
  if isFull==false
    return false
  end
end

def winner(board)
  ab=won?(board)
  if ab==false
    return nil
  elsif board[ab[0]]=="X" && board[ab[1]]=="X" && board[ab[2]]=="X"
    return "X"
  elsif board[ab[0]]=="O" && board[ab[1]]=="O" && board[ab[2]]=="O"
    return "O"
  end
end