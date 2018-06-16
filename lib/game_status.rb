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
  i = 0
  WIN_COMBINATIONS.each{|win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      i +=1
      return win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      i +=1
      return win_combination
    end
  }
  if i == 0
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

def draw?(board)
  if(full?(board) == true && won?(board) == false )
    return true
  else
    return false
  end
end

def over?(board)
  if(full?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  i = 0
  WIN_COMBINATIONS.each{|win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      i +=1
      return "X"
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      i +=1
      return "O"
    end
  }
  if i == 0
    return nil
  end
end
