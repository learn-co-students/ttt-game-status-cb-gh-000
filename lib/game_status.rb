# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Top row
  [0,3,6],
  [1,4,7], # Top row
  [2,5,8],  # Middle row
  [0,4,8], # Top row
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if(board[combo[0]] == board[combo[1]] and board[combo[0]] == board[combo[2]] and position_taken?(board, combo[0]))
      return combo
    end
  end

  return false
end

def full?(board)
  for i in 0..8 do
    if(!position_taken?(board, i))
      return false
    end
  end

  true

  # board.each do |index|
  #   if(!position_taken?(board, index))
  #     return false
  #   end
  # end
  #
  # true
end

def draw?(board)
  if(!won?(board) and full?(board))
    true
  else
    false
  end
end

def over?(board)
  if(won?(board) or full?(board))
    true
  else
    false
  end
end

def winner(board)
  status = won?(board)
  if(!status)
    return nil
  end

  board[status[0]]
end
