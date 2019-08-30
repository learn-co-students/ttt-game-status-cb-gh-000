# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  for win in WIN_COMBINATIONS
    if win.all? {|index| position_taken?(board, index) && board[index]==board[win[0]]}
      return win
    end
  end
  return false
end

def full?(board)
  full = true
  (0..8).each do |num|
    full = full && position_taken?(board, num)
  end
  return full
end

def draw?(board)
  return full?(board) && !won?(board) ? true : false
end

def over?(board)
  return won?(board) || draw?(board) ? true : false
end

def winner(board)
  won = won?(board)
  return won ? board[won[0]] : nil
end
