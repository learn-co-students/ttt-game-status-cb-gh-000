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
  status = false
  WIN_COMBINATIONS.each do |i|
    if (board[i[0]] == "X" && board[i[1]] == "X" && board[i[2]] == "X") || (board[i[0]] == "O" && board[i[1]] == "O" && board[i[2]] == "O")
      return i
      break
    end
  end
  status
end

def full?(board)
  if board.any? { |e| e == " " || e == "" || e.nil? }
    false
  else
    true
  end
end

def draw?(board)
  (full?(board) && !won?(board))? true : false
end

def over?(board)
  won?(board) || full?(board) ? true : false
end

def winner(board)
  winning_combination = won?(board)
  if !over?(board) || !won?(board)
    nil
  else
    board[winning_combination[0]]
  end
end
