# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
[3,4,5],
[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def full?(board)
  return !(board.any? {|cell| cell==" "})
end

def draw?(board)
  if won?(board)==nil and full?(board)
    return true
  end
  return false
end

def over?(board)
  if full?(board) or won?(board) != nil
    return true
  end
  return false
    
end

def winner(board)
  returned= won?(board)
  if returned!=nil
    return board[returned[0]]
  end
  return nil
end

def won?(board)
  WIN_COMBINATIONS.each do |combinations|
    if board[combinations[0]]==board[combinations[1]] and board[combinations[2]] == board[combinations[1]] and board[combinations[1]] != " "
      return combinations
    end
  end
  return nil

end