# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  # Vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
  # Diagonal
  [0,4,8],
  [6,4,2]
  # ETC, an array for each win combination
]

def won?(board)
  if (board.empty?)
    return false
  end
  if (full?(board))
    return false
  end
  WIN_COMBINATIONS.each do |combination|
    combX = combination[0]
    combY = combination[1]
    combZ = combination[2]
    if (!combination.all? { |e|  position_taken?(board, e) })
      next
    end
    if (combinationMatch?(board, combination) || combinationMatch?(board, combination, 'O'))
      return combination
    end
  end
  return false
end

def combinationMatch?(board, combination, character = 'X')
  return combination.all? do |index|
      board[index] == character
  end
end

def draw?(board)
  if WIN_COMBINATIONS.none? do |combination|
      combinationMatch?(board, combination)
    end
    if full?(board)
        return true
    end
  end
  return false
end

def full?(board)
  return !(board.include?(' ') || board.include?(''))
end

def over?(board)
  return won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winner = won?(board)
  if (winner == false)
    return nil
  else
    WIN_COMBINATIONS.each do |combination|
      if (combinationMatch?(board, combination, 'X'))
        return 'X'
      elsif (combinationMatch?(board, combination, 'O'))
        return 'O'
      end
    end
  end
end
