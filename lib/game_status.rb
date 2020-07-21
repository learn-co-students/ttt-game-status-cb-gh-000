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


def full?(board)
  board.flatten.all?{ |el| el=="X" || el=="O" }
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    arr = [board[win_index_1], board[win_index_2], board[win_index_3]]

    if arr.all?{|el| el == "X"} || arr.all?{|el| el == "O"}
      return win_combination
    end
  end
  return false
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) ? true : false
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
