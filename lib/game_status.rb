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
   [6,4,2]
]

def won?(board)
  result = false
  WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
        result = [combo[0], combo[1], combo[2]]
      elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
        result = [combo[0], combo[1], combo[2]]
      end
  end
  return result
end

def full?(board)
  full_board = board.all? do |number|
     number != " " && number != "" && number != nil
  end
  return full_board
end

def draw?(board)
  won = won?(board)
  isFull = full?(board)
  if won == false && isFull == true
    return true
  elsif won != false && isFull == false
    return false
  elsif won == false && isFull == false
    return false
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
  token = won?(board)
  if token != false
    return board[token[0]]
  else
    return nil
  end
end
