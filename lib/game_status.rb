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
  win = false
  WIN_COMBINATIONS.each do |win_combination|
    if position_taken?(board,win_combination[0]) && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]]
      return win_combination
      win = true
    end
  end
  if(!win)
    return false
  end
end

def full?(board)
  board.all? do |char|
    !(char == nil || char == " ")
  end
end

def draw?(board)
  !won?(board)
end

def over?(board)
  if full?(board)
   (draw?(board) || won?(board))
 elsif won?(board)
   return true
 else
   return false
 end
end

def winner(board)
  win_combination = won?(board)
  if win_combination != false
    return board[win_combination[0]]
  else
    nil
  end
end
