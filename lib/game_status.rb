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
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? { |index| board[index].strip == "X" } ||
      win_combination.all? { |index| board[index].strip == "O" }
      return win_combination
    end
  end
  false
end

def full?(board)
  board.none? { |cell| cell == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    index_winner = won?(board)[0]
    return board[index_winner].strip
  end
  nil

end
