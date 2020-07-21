# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
            [0,1,2], #top row
            [3,4,5],  #middle row
            [6,7,8],  #bottom row
            [0,3,6],  #left column
            [1,4,7],  #middle column
            [2,5,8],  #right column
            [0,4,8],  #diagonal left
            [2,4,6]]  #diagonal right

def won?(board)
    WIN_COMBINATIONS.each do |row|
            win1=row[0]
            win2=row[1]
            win3=row[2]  
            if (board[win1] == "X" && board[win2] =="X" && board[win3]== "X") ||(board[win1] == "O" && board[win2] =="O" && board[win3]== "O")
            return row
            end    
    end
    false
end

def full?(board)
  flag=true
    board.each do |elements|
        if elements== " "|| elements==""
            flag=false
        end
    end
    return flag  
end

def draw?(board)
    if !won?(board)&& full?(board)
         true
    elsif !won?(board) && !full?(board)
         false
    elsif won?(board)
         false
    else
    end  
end

def over?(board)
    if won?(board) || draw?(board) || full?(board)
      true
    else
      false
    end
end

def winner(board)
  ary = won?(board)
  if won?(board)
    return board[ary[0]]
  else
    return nil
  end
end