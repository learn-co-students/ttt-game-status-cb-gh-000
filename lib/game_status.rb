def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
def won?(board)
  WIN_COMBINATIONS.each do |cur|
    if(board[cur[0]]=="X" && board[cur[1]]=="X" && board[cur[2]]=="X")
      return cur
    end
    if(board[cur[0]]=="O" && board[cur[1]]=="O" && board[cur[2]]=="O")
      return cur
    end
  end
  return nil
end

def full?(board)
  ind=0
  9.times{
    if(board[ind]!="X" && board[ind]!="O")
      return false
    end
    ind+=1
  }
return true
end

def draw?(board)
  if(full?(board) && !won?(board))
    return true
  end
  return false
end

def over?(board)
  return (full?(board)||won?(board))
end

def winner(board)
  x=won?(board)
    if(x)
      if(board[x[0]]=="X")
        return "X"
      else
        return "O"
      end
    end
    return nil
end
