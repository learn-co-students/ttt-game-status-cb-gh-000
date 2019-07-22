# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

def won?(board)
  win = false
  winna = []
  empty_board = board.all? {|x| x == " "}
  WIN_COMBINATIONS.each do |combo|
    if empty_board
      return false
    elsif combo.all? { |value| board[value] =="X" } || combo.all? { |value| board[value] =="O" }
      win = combo
    end
  end
  return win
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  if (won?(board) == false) && full?(board)
    return true
  elsif !(won?(board) == false) && !full?(board) || !won?(board)
    return false
  end
end

def over?(board)
  if !(won?(board) == false) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !(won?(board) == false)
    return board[won?(board)[0]]
  end
end
