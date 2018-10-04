# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
   index_1=win_combination[0]
   index_2=win_combination[1]
   index_3=win_combination[2]

   position_1 = board[index_1]
   position_2 = board[index_2]
   position_3 = board[index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win_combination # return the win_combination indexes that won.
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination # return the win_combination indexes that won.
   end
 end
 return false
 end

 def full?(board)
   chars_only= board.select{|el| el == "X" || el=="O" }
   if chars_only.length == 9
     return true
  else
    return false
  end
  end


  def draw?(board)
    if won?(board) == false && full?(board)
      return true
    else
      return false
    end
  end

  def over?(board)
    return won?(board)!= false || draw?(board) || full?(board)
  end


  def winner(board)
    outcome= won?(board)
    if outcome==false
      return nil
    else
      return board[outcome[0]]
  end
end
