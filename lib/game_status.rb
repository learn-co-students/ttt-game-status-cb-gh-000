# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,4,8], # Top row
  [2,4,6],
  [1,4,7],
  [0,3,6],
  [2,5,8]
]


def won?(board)
  WIN_COMBINATIONS.each do |combination|
    combX = combination.select do |index|
      board[index] == 'X'
    end
    if combX.size == 3
      return combX
    end

    combO = combination.select do |index|
      board[index] == 'O'
    end
    if combO.size == 3
      return combO
    end
  end
  return false
end


def full?(board)
  board.all? do |elements|
    elements == 'X' || elements == 'O'
  end
end

def draw?(board)
  (!won?(board)) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  win = won?(board)
board[win[0]] if win
end
