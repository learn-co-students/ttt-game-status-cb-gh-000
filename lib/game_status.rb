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
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if win.all?{|index| board[index] == "X"} || win.all?{|index| board[index] == "O"}
      return win
    end
  end
  return nil
end

def full?(board)
  (0..board.length-1).to_a.all? do |index|
    position_taken?(board, index)
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  combination = won?(board)
  if combination
    board[combination[0]]
  else
    nil
  end
end
