def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left Column
  [1,4,7], # Central column
  [2,5,8], # Right Column
  [0,4,8], # Diagonal 1
  [2,4,6] # Diagonal 2
]

def won?(board)
  # it is possible to do this with 3 lines by using #detect
  # #detect returns first combo that satisfies that condition
  # else it returns nil. Also, #detect is the same is #find.
 WIN_COMBINATIONS.detect do |combo|
   win_index_1 = combo[0]
   win_index_2 = combo[1]
   win_index_3 = combo[2]
   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]

   # there is a more elegant way to do this, but this is the most
   # human readable way to do it...
   (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
   (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  full?(board) && !won?(board) #this is such a nice example of readable ruby
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  # remember, that returning anything other than nil, or false is truthy, so
  # the fact that #won? returns the index of the winning combo is no problem
  if won?(board)
    combo = won?(board)
    board[combo[0]]
  else
    return nil
  end
end
