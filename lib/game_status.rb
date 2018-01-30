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
  WIN_COMBINATIONS.each do |win_combination|
    winx = win_combination.all? do |cell|
      board[cell]=="X"
    end
    wino = win_combination.all? do |cell|
      board[cell]=="O"
    end
    if winx || wino
      return win_combination
    end
  end
  return false
end

def full?(board)
   board.all? do |cell|
     cell!=" "
   end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  won?(board)||full?(board)||draw?(board)
end

def winner(board)
  win = won?(board)
  if win
    winner = board[win[0]]
  else
    return nil
  end
  winner
end
