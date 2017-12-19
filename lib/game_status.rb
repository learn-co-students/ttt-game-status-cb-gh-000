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
    if position_taken?(board, comb[0])
      if board[comb[0]] == board[comb[1]] && board[comb[0]] == board[comb[2]]
        return comb
      end
    end
  end

  return false
end

def full?(board)
  indexTaken = board.select{ |index| index == "X" || index == "O"}

  if indexTaken.length != board.length
    return false
  end

  return true
end

def draw?(board)
  if full?(board)
    if won?(board)
      return false
    else
      return true
    end
  end
  return false
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end

  return false
end

def winner(board)
  if over?(board)
    winning = won?(board)
    return board[winning[0]]
  end
end
