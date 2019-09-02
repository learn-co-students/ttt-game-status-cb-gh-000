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
  status= false
  WIN_COMBINATIONS.each do |win_array|
    if board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X" || board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
      return win_array
      break
    end
  end
status
end

def full?(board)
  if board.any? {|x| x== " " || x == "" || x.nil?}
    false
  else
    true
  end
end

def draw?(board)
  if !(won?(board)) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  the_winner = won?(board)
  if !over?(board) || !won?(board)
    nil
  else
    board[the_winner[0]]
  end
end
