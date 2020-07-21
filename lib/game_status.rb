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
  x_turns = x_index(board)
  o_turns = o_index(board)
  if x_turns.empty? && o_turns.empty?
    return false
  end
  WIN_COMBINATIONS.detect do |win_combination|
    (x_turns & win_combination).sort == win_combination.sort || (o_turns & win_combination).sort == win_combination.sort
  end
end

def full?(board)
  empty_turns = board.select do |position|
    position.strip == ""
  end

  empty_turns.empty?
end

def draw?(board)
  won?(board) == nil
end

def over?(board)
  (draw?(board) && full?(board)) || won?(board) != nil
end

def winner(board)
  x_turns = x_index(board)
  o_turns = o_index(board)
  winner = nil
  if won?(board) != nil
    if (x_turns & won?(board)).sort == won?(board).sort
      winner = "X"
    elsif (o_turns & won?(board)).sort == won?(board).sort
      winner = "O"
    end
  end
end

def x_index(board)
  board.each_index.select do |i|
    board[i] == "X"
  end
end

def o_index(board)
  board.each_index.select do |i|
    board[i] == "O"
  end
end
