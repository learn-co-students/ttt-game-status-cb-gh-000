# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [0,3,6], [0,4,8], [3,4,5], [1,4,7], [2,4,6],[6,7,8], [2,5,8]]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
   board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end



def full?(board)
  counter=0
  co=0
  board.each do |k|
    if k == " "
      return false
    end
    if k== "X"
      counter +=1
    else k== "O"
      co +=1
    end
    counter
    co
    if counter == co
      return true
    end
  end
end
def draw?(board)
  if won?(board)
    return false
  elsif (full? (board)) and !(won?(board))
    return true
  elsif !(full(board)) and !(won?(board))
    return false
  else
    return true
  end

end

def over?(board)
  if full?(board) and !won?(board)
    return true
  end
  if won?(board)
    return true
  else
    return false
  end

end

def winner(board)

   if winning_combo = won?(board)
     board[winning_combo.first]
   end
  end



#WIN_COMBINATIONS.detect do |combo|
# board[combo[0]] == board[combo[1]] &&
#  board[combo[1]] == board[combo[2]] &&
#  position_taken?(board, combo[0])
#end

#if !won?(board) and full?(board)
#  return nil
#end
