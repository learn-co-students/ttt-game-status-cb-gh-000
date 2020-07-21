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
  counter = 0
  until counter == 8
    combo = WIN_COMBINATIONS[counter]

    if ( (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O") )
      return combo
    else
      counter += 1
    end
  end

end

def full?(board)
  j = 0

  board.each do |square|
    if (square == "X" || square == "O")
      j += 1
    end
  end

  return (j == 9)
end


def draw?(board)
  if (full?(board) && (won?(board) == nil) )
    return true
  end
end


def over?(board)
  return (draw?(board) || (won?(board) != nil) )
end


def winner(board)
  if won?(board) != nil
    winning_combo = won?(board)
    return board[winning_combo[0]]

  else
    return nil
  end

end
