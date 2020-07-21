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
  [2, 4, 6]
]

def success?(board, array)
  pos0 = board[array[0]]
  pos1 = board[array[1]]
  pos2 = board[array[2]]
  ((pos0 == "X" && pos1 == "X" && pos2 == "X") || (pos0 == "O" && pos1 == "O" && pos2 == "O"))
end

def full?(board)
  i = 0
  full = true
  while i < 9
    if !position_taken?(board, i)
      full = false
    end
    i += 1
  end
  full
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def won?(board)
  WIN_COMBINATIONS.detect do |array|
    success?(board, array)
  end
end

def winner(board)
  if (won?(board))
    pos = won?(board)[0]
    board[pos]
  else
    nil
  end
end
