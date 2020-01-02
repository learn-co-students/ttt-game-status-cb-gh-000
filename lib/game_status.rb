# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
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
  comb=[]
  counter = 0
  
  WIN_COMBINATIONS.each do |i|
    
      if board[i[0]] == 'X' && board[i[1]] == 'X' && board[i[2]] == 'X'
        counter+=1
        comb=i
      elsif board[i[0]] == 'O' && board[i[1]] == 'O' && board[i[2]] == 'O'
        counter+=1
        comb = i
      end
  end
  if counter >= 1 
    return comb
  else
    return false 
  end
end

def full?(board)
  board.all?{|i| i != " " && i != "" && i != nil }
end

def draw?(board)
  if won?(board).class != Array && full?(board)
    return true 
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board)
    return true 
  else
    return false
  end
end

def winner(board)
  win=won?(board)
  if win
    return board[w[0]]
  else
    nil 
  end
end