# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def won?(board)
  odp = WIN_COMBINATIONS.detect do |comb|
    board[comb[0]]=="X" && board[comb[1]]=="X" && board[comb[2]]=="X" || board[comb[0]]=="O" && board[comb[1]]=="O" && board[comb[2]]=="O"
      end
odp ? odp : false
end
def full?(board)
  board.all?{|slot| slot == "X" || slot == "O"}? true : false
end
def draw?(board)
if won?(board)
  return false
end
if !won?(board) && full?(board)
  return true
end
end
def over?(board)
  won?(board) || draw?(board) || full?(board)
end
def winner(board)
  win = won?(board)
  if(!win)
    nil
  else
    board[win[0]]
  end
end
