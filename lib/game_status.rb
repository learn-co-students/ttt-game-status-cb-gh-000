# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def empty?(board)
  board.each do |i|
    if (i != " ")
      return false;
    end
  end

  return true
end

def same_player?(board, combo)
  i = combo[0]
  j = combo[1]
  k = combo[2]

  return ((board[i] == 'X' && board[j] == 'X' && board[k] == 'X')\
  || (board[i] == 'O' && board[j] == 'O' && board[k] == 'O'))
end

def won?(board)
  if (empty?(board))
    return false;
  end

  WIN_COMBINATIONS.each do |combo|
    if (same_player?(board, combo))
      return combo;
    end
  end

  return false;
end

def full?(board)
  board.each do |i|
    if i.strip == ""
      return false
    end
  end
  return true
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  return won?(board) || full?(board) || draw?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
    n = combo[0]
    j = combo[1]
    k = combo[2]
    if (same_player?(board, combo))
      return board[n]
    end
  end

  return nil
end
