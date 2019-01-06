# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]
def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
      win_index1=win_combo[0]
        win_index2=win_combo[1]
          win_index3=win_combo[2]
          
                    if (board[win_index1]=="X" && board[win_index2]=="X" && board[win_index3]=="X") || (board[win_index1]=="O" && board[win_index2]=="O" && board[win_index3]=="O")
                      return win_combo
                    end
                end
                 false
end  

def full?(board) 
board.none? { 
#returns true if all iterations return false
|val|
val==" "
}
end  
def draw?(board)
  if full?(board)==true && won?(board)==false
  return true
  elsif won?(board)==false&& full?(board)==false
  return false
  elsif won?(board)==true
  return false 
  end  
end

def over?(board)
 if won?(board)!=false
  return true
 elsif full?(board)==true
 return true
 elsif won?(board)==false && full?(board)==true
  return true
 else 
  return false
end  
end

  
def winner(board)
  cx=0 
  colear=0
  arr=won?(board)
  if arr!=false
    arr.each do |i|
      if board[i]=="X"
        cx+=1
      elsif board[i]=="O"
      co+=1
      end 
  end
  if(cx==3)
  return "X"
elsif (co==3)
return "O"
else
  nil
end 
end
 
end 