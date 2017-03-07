def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [3, 4, 5],
  [6, 4, 2],
  [6, 7, 8]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    combination.all? do |index|
      position_taken?(board, index) && board[index] == board[combination[0]]
    end
  end
end

def full?(board)
  board.all? do |total|
    total == "X" || total == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board) 
    board[won?(board)[0]]
  end
end
