# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |top_row_win|
    if ((board[top_row_win[0]] == board[top_row_win[1]]) && (board[top_row_win[1]] == board[top_row_win[2]])) && (board[top_row_win[0]] != " ")
      return top_row_win
    end
  end
  false
end

def full?(board)
  if(board.detect{|x| x == " "})
    return false
  end
  true
end

def draw?(board)
  if(full?(board) && !(won?(board)))
    return true
  end
  false
end

def over?(board)
  if(draw?(board) || won?(board))
    return true
  end
  false
end

def winner(board)
  if(draw?(board) || !(over?(board)))
    return nil
  end
  ary = won?(board)
  return board[ary[1]]
end
