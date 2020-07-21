# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |pos|
    if(board[pos[0]] == board[pos[1]] && board[pos[1]] == board[pos[2]] && board[pos[0]]!= " ")
      return pos
    end
  end
  return false
end

def full?(board)
  return !(board.any? {|num| num == " " } )
end

def draw?(board)
  return !(won?(board)) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if (won?(board))
    return board[won?(board)[0]]
  else
    return nil
  end
end
