# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #bottom row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
# ETC, an array for each win combination
]

def winner(board)
  win = won?(board)
  if (win.class == Array)
    return board[win[0]]
  else
    return nil
  end
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def draw?(board)
  full?(board) && !won?(board)
end

def full?(board)
  all_full = board.all? do |pos|
    pos != " "
  end
end

def won?(board)
  # Check if empty board
  empty = board.all? do |pos|
    pos == " " || pos == "" || pos == nil
  end

  if empty
    return false
  end

  # Returns the win combination or nil (falsey)
  win = WIN_COMBINATIONS.detect do |win|
    win1 = win[0]
    win2 = win[1]
    win3 = win[2]

    pos1 = board[win1]
    pos2 = board[win2]
    pos3 = board[win3]

    pos1 == "X" && pos2 == "X" && pos3 == "X" ||
    pos1 == "O" && pos2 == "O" && pos3 == "O"
  end
end
