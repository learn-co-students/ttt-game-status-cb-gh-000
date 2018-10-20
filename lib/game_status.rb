# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  empty = board.all? do |space|
    space == " "
  end
  if empty
    return false
  end

  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]])
      if (board[combo[0]] != " ")
        return combo
      end
    end
  end

  if (full?(board) == true)
    return false
  end

end

def full?(board)
  isitempty = board.detect do |space|
    space == " "
  end

  if (isitempty == nil)
    return true
  else
    return false
  end
end

def draw?(board)

  winner = false

  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]]==board[combo[1]] && board[combo[1]]==board[combo[2]])
      if (board[combo[0]] != " ")
        winner = true
      end
    end
  end

  if (winner==true)
    return false
  end

  if (full?(board)==true)
    return true
  end
end

def over?(board)
  if draw?(board)
    return true
  end

  if won?(board)
    return true
  end
end

def winner(board)

  if draw?(board)
    return nil
  end

  if won?(board)
    WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]]==board[combo[1]] && board[combo[1]]==board[combo[2]])
        if (board[combo[0]] == "X")
          return "X"
        end
        if (board[combo[0]] == "O")
          return "O"
        end
      end
    end
  end
end

#all thx to the fried list for the tech support
