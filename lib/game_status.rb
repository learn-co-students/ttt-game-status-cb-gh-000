def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
def won?(board)
  WIN_COMBINATIONS=[[0,1,2],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
  WIN_COMBINATIONS.each do |cur|
    if(board[cur[0]]=="X" && board[cur[1]]=="X" && board[cur[2]]=="X")
      return cur
    end
    if(board[cur[0]]=="O" && board[cur[1]]=="O" && board[cur[2]]=="O")
      return cur
    end
  end
end

def full?(board)
  ans=0
  board.each |x|
    if(x=="X" || x=="O")
      ans+=1
  end
  return ans==9
end

def draw?(board)
  if(won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  return full?(board)
end

def winner(board)
  x=won?(board)
    return x[0]


end
