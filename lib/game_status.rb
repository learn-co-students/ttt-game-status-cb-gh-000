# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #TOP row
  [3,4,5], #MIDDLE row
  [6,7,8], #BOTTOM row
  [0,3,6], #LEFT COLLUM
  [1,4,7], #MIDDLE COLLUMN
  [2,5,8],  #RIGHT COLLUMN
  [0,4,8], #backward diagonals
  [6,4,2]  #forward diagonals
]

def won?(board)
  #check if board is empty
  all_empty = board.all? do |empty|
    if empty == "" || empty == " "
      empty = true
    end
  end

  if all_empty
    return false
  end

  WIN_COMBINATIONS.each do |win_combination|
    # WINNING COMBINATION CONSTANTS
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] #board[0] = X
    position_2 = board[win_index_2] #board[1] = X
    position_3 = board[win_index_3] #board[2] = X

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end

    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end

  draw?(board)

  return false
end

def draw?(board)
  #checks for draw

  if board[0] == "X" && board[1] == "X" && board[2] == "X"
    return false
  elsif (board[0] == "X" && board[4] == "X" && board[8] == "X") || (board[2] == "X" && board[4] == "X" && board[6] == "X")
    return false
  end
  draw = board.all? do |occupied|
    if occupied == "X" || occupied == "O"
      occupied = true
    end
  end
  if draw
    return true
  else
    return false
  end
end

def over?(board)
  # if draw?(board) || full?(board) || won?(board)
  #   return true
  # else
  #   return false
  # end
  (draw?(board) || full?(board) || won?(board))? true : false
end

def full?(board)
  if draw?(board)
    return true
  else
    return false
  end

  inP = board.any? do |used|
    if used == " " || empty == ""
      inp = true
    end
  end
  if inp
    return false
  else
    return true
  end
end


def winner(board)
  count = 0

  if won?(board) != false
    board.each do |i|
      if i == "X"
        count += 1
      end
      if i == "O"
        count += 1
      end
    end
    player = count % 2
    player != 0 ? "X" : "O"
  elsif over?(board)
    return false
  end

end
