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
  counter = 0
  comb=[]
  WIN_COMBINATIONS.each do |c|
    
      if board[c[0]] == 'X' && board[c[1]] == 'X' && board[c[2]] == 'X'
        counter+=1
        comb=c
      elsif board[c[0]] == 'O' && board[c[1]] == 'O' && board[c[2]] == 'O'
        counter+=1
        comb = c
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
  w=won?(board)
  if w
    return board[w[0]]
  else
    nil 
  end
end