# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=  [
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
  WIN_COMBINATIONS.each do |win_combination|

  if board[win_combination[0]]==board[win_combination[1]] && board[win_combination[1]]==board[win_combination[2]] && (board[win_combination[0]]=="X" || board[win_combination[0]]=="O")
return win_combination
end
end
return false
end
def full?(board)
  board.all? { |i| i=="X" || i=="O"}
end
def draw?(board)
  (!won?(board) && full?(board))
end
def over?(board)
  !(!(won?(board) || full?(board) || draw?(board)))
end
def winner(board)
  win_combination=won?(board)
  if (win_combination!=false)
    winning=board[win_combination[0]]
return winning
  end
end
