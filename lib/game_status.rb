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
  WIN_COMBINATIONS.each do |comb|

    if board[comb[0]]==board[comb[1]] && board[comb[1]]==board[comb[2]] && (board[comb[0]]=="X" || board[comb[0]]=="O")
      return comb
    end
  end
  return false
end

def full?(board)
  board.all?{|i| i=="X" || i=="O"}
end

def draw?(board)
  (!won?(board) && full?(board))
end

def over?(board)
  !(!(won?(board) || full?(board) || draw?(board)))
end

def winner(board)

  combination = won?(board)
  if((combination))
    return board[combination[0]]
  else
    return nil
  end

end
