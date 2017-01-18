# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |w|
    if position_taken?(board, w[0])
      c = board[w[0]]
      return w if board[w[1]] == c && board[w[2]] == c
    end
  end
  false
end

def full?(board)
  (0..8).all? do |i|
    position_taken?(board, i)
  end
end

def draw?(board)
  (full?(board) && !won?(board))
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won = won?(board)
  won ? board[won[0]] : nil
end

def turn_count(board)
  turns = 0
  board.each do |t|
    turns += 1 if t == 'X' || t == 'O'
  end
  turns
end

def current_player(board)
  turns = turn_count(board)
  turns % 2 == 0 ? 'X' : 'O'
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