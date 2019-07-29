# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |comb|
    pos1 = board[comb[0]]
    pos2 = board[comb[1]]
    pos3 = board[comb[2]]
    if ((pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O"))
      return comb
    end
  end
  return false
end

def full?(board)
    board.each do |elem|
      if (elem == " ")
        return false
      end
    end
    return true
end

def draw?(board)
  if (full?(board) && !won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) || draw?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if (draw?(board))
    return nil
  elsif (won?(board))
    win = won?(board)
    pos1 = board[win[0]]
    if (pos1 == "X")
      return "X"
    else
      return "O"
    end
  end
end
    
