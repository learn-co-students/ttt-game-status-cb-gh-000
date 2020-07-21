# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
def won?(board)
  WIN_COMBINATIONS.each do |combination|

    return combination if position_taken?(board, combination[0]) && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
  end

false
end


def full?(board)
  !(board.include?(" ") || board.include?(nil))
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  (combination = won?(board)) ? board[combination[0]] : nil
end
