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
  won = WIN_COMBINATIONS.detect do |combination|
    position_taken?(board,combination[0]) && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
  end
  return won
end

def full?(board)
  counter = 0
  while counter<board.length
    if !position_taken?(board,counter)
      return false
    end
    counter+=1
  end
  return true
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  if !won?(board)
    return nil
  end
  return board[won?(board)[0]]


end
