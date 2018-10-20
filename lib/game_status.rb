# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
]

def won?(board)
  WIN_COMBINATIONS.find do | pos |
    position_taken?(board, pos[0]) && board[pos[0]] == board[pos[1]] && board[pos[1]] == board[pos[2]]
  end
end

def full?(board)
  (0..8).all?{|x| position_taken?(board, x)}
end

def draw?(board)
  full?(board) && ! won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  win_pos = won?(board)
  win_pos ? board[win_pos[0]] : nil
end
