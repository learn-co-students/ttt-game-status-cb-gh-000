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
  [6,4,2]
]
def won?(board)
  counter = 0
  for win_combination in WIN_COMBINATIONS
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      counter +=1
      return win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      counter +=1
      return win_combination
    end
  end
  if counter == 0
    return false
  end
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end



def over?(board)
  if full?(board)
    return true
  elsif won?(board)
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  counter = 0
  for win_combination in WIN_COMBINATIONS
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      counter +=1
      return "X"
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      counter +=1
      return "O"
    end
  end
  if counter == 0
    return nil
  end
end
