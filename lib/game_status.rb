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
  WIN_COMBINATIONS.each do |winCombinationarray|
    winner=[]
    oindex=0
    xindex=0
    winCombinationarray.each do |winCombinationEach|
      if board[winCombinationEach]=="X"&&oindex==0
        xindex+=1
        winner<<winCombinationEach
      elsif board[winCombinationEach]=="O"&&xindex==0
        oindex+=1
        winner<<winCombinationEach
      end
    end
    if xindex==3||oindex==3
      return winner
    end
  end
  return false
end

def full?(board)
  inprogress=false
  board.each do |eachBoard|
    if eachBoard==" "||eachBoard==""
      inprogress=true
    end
  end
  if !inprogress && !won?(board)
    return true
  else
    return false
  end
end

def draw?(board)
  inprogress=false
  board.each do |eachBoard|
    if eachBoard==" "||eachBoard==""
      inprogress=true
    end
  end
  if !inprogress && !won?(board)
    return true
  else
    return false
  end
end
def over?(board)
  if won?(board)||draw?(board)
    return true
  end
end
def winner(board)
  if !won?(board)
    return nil
  end
  won?(board).each do |theWinner|
    if board[theWinner]=="X"
      return "X"
    elsif board[theWinner]=="O"
      return "O"
    end
  end
end
