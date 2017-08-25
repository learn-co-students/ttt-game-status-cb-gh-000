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

def won?(board)
  WIN_COMBINATIONS.each do |win_c|
    if position_taken?(board, win_c[0]) && board[win_c[0]] == board[win_c[1]] && board[win_c[1]] == board[win_c[2]]
      return win_c
    end
  end
  false
end

def full?(board)
  board.none?{|tile| tile == "" || tile == " " || tile == nil}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winning_combination = won?(board)
  if winning_combination
    board[winning_combination[0]]
  else
    nil
  end
end
