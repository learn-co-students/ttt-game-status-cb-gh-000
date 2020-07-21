# Helper Method
def position_taken?(board, index)

if board[index] == " "
  return false
elsif board[index] == ""
  return false
elsif board[index] == nil
  return false
elsif (board[index] == "X" || board[index] == "O")
  return true
end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # top row
  [3,4,5],  # middle row
  [6,7,8],  # bottom row
  [0,3,6],  # left column
  [1,4,7],  # middle column
  [2,5,8],  # right column
  [0,4,8],  # left diagnol
  [2,4,6]   # right diagnol
]


def won?(board)
 all_empty = [0,1,2,3,4,5,6,7,8].all? do |index|
   !position_taken?(board, index)
 end

 if all_empty
   return false
 end

failure_count = 0

WIN_COMBINATIONS.select do |win_array|

position_1 = board[win_array[0]]   # WIN_COMBINATIONS[element] = [0,1,2] WIN_COMBINATIONS[element][0] = 0 ; element = 0
position_2 = board[win_array[1]]
position_3 = board[win_array[2]]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_array
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_array
  else
    failure_count += failure_count
  end
end

if failure_count == 9
  return false
end
end


def full?(board)
 all_full = [0,1,2,3,4,5,6,7,8].all? do |index|
   position_taken?(board, index)
 end

 if all_full
   return true
 else
   return false
 end
end



def draw?(board)

win_array_exists = won?(board)

if win_array_exists.class == Array || !full?(board)
  return false

elsif win_array_exists == nil && full?(board)
  return true
end
end


def over?(board)

win_array_exists = won?(board)

if full?(board) || draw?(board) || win_array_exists.class == Array
  return true
else
  return false
end
end


def winner(board)
win_combo = won?(board)

if win_combo.class == Array
   if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
     return "X"
   elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
     return "O"
   end
 elsif win_combo == false
   return nil
end
end
