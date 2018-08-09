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
  [6,4,2],
  [0,4,8]
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |combo| 
    if board[combo[0]] == board[combo[1]] &&  board[combo[1]] == board[combo[2]]
      winner = combo.all? do |index| 
        position_taken?(board, index)
        end
      if winner 
         return combo
        break
      end
    end
   end
  return FALSE
end
   
def full?(board)
  board.each_with_index do |space, index|
    if  !position_taken?(board, index)
      return FALSE
    end
  end
  return TRUE
end


def draw?(board)
  full?(board) && !won?(board)
end  

def over?(board)
  won?(board) || draw?(board) 
end

def winner(board)
  winIndex = won?(board)
  if winIndex == FALSE
    return nil
  end
  winChar = board[winIndex[0]] 
  if winChar == "X" || winChar == "O"
    return winChar
  end
end
