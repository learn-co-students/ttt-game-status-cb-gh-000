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

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    p_1 = board[combination[0]]
    p_2 = board[combination[1]]
    p_3 = board[combination[2]]
    if p_1 == "X" && p_2 == "X" && p_3 == "X"
      return combination
    elsif p_1 == "O" && p_2 == "O" && p_3 == "O"
      return combination
    end
  end
  false
end

def full?(board)
  if board.find{|i| i == " "} || board.find{|i| i == ""}
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    false
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    combo = won?(board)
    return board[combo[0]]
  else
    return nil
  end
end
