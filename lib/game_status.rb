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
  WIN_COMBINATIONS.each do |combination|
    index1 = combination[0]
    index2 = combination[1]
    index3 = combination[2]
    if position_taken?(board, index1) && position_taken?(board, index2) && position_taken?(board, index3)
      if (board[index1] == board[index2]) && (board[index2] == board[index3])
        return combination
      end
    end
  end
  return false
end

def full?(board)
   board.all? do |position|
    position == "O" || position == "X"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if draw?(board) || !over?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end
