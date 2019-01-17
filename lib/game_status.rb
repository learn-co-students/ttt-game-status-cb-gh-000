# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row

  [0,3,6], # Left row
  [1,4,7], # Middle row
  [2,5,8], # Right row

  [0,4,8], # Cross Left
  [2,4,6] # Cross Right
]


def won?(board)
    chkwon = 0
    WIN_COMBINATIONS.each do |win_combination|

    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

     if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        chkwon = 1
        return win_combination # return the win_combination indexes that won.
     end
   end
   if chkwon == 0
     return false
   end
end

def full?(board)
 return board.none?{|i| i ==" "}
end

def over?(board)
 if won?(board)
   return true
 elsif draw?(board)
   return true
 else
   return false
 end
end


def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def winner(board)
 win_combination = won?(board)
 if win_combination != false
  return board[win_combination[0]]
 else
   return nil
 end
end
