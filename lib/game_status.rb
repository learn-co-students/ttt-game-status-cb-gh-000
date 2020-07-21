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
  [0,4,8],
  [2,4,6]
]

def won?(board)

counter = 0
loop do
    win_combination = WIN_COMBINATIONS[counter]

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3



    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
         false
      end

      counter += 1

      if counter == 8
        break
      end

  end
end

def full?(board)

  board.none? {|i| i.include?(" ")}

end

def draw?(board)

if full?(board) == true && !won?(board)
  return true
elsif  full?(board) == false || won?(board) != false
    return false
  end
end

def over?(board)

  if won?(board) || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)

if won?(board)

  winner_array = won?(board)
  index = winner_array[0]

  winner = board[index]

  if winner == "X"
    return "X"
  elsif winner == "O"
    return "O"
  end
else
  return nil

end

end
