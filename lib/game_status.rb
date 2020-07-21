# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6],

]

def won?(board)
  WIN_COMBINATIONS.each{|comba|
    if board[comba[0]]==board[comba[1]] && board[comba[0]]!=" "&& board[comba[0]]!=""
      if board[comba[1]]==board[comba[2]]
        return board=[comba[0],comba[1],comba[2]]
      end
    end
  }
  return false
end

def full?(board)
  board.all?{|char| char=="X" or char=="O"}
end

def draw?(board)
  if !full?(board)
    return false
  end
return !won?(board)
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  elsif full?(board)
    true
  else
    false
  end
end

def winner(board)
  winnerIndex=won?(board)
  if won?(board)
    return board[winnerIndex[0]]
  end
end
