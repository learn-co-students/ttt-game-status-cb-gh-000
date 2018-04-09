# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  win = []
  WIN_COMBINATIONS.each do |win_combination|
    index_1 = win_combination[0]
    index_2 = win_combination[1]
    index_3 = win_combination[2]

    win_combination.each do |index|
      if board[index_1] == "X" && board[index_2] == "X" && board[index_3] == "X"
        win << index
      elsif board[index_1] == "O" && board[index_2] == "O" && board[index_3] == "O"
        win << index
      end
    end
  end
  if win == []
    nil
  else
    win.to_ary
  end
end

def full?(board)
  if board.detect{|empty_space| empty_space == " "}
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    array = won?(board)
    index1 = array[0]
    if board[index1] == "X"
      "X"
    elsif board[index1] == "O"
      "O"
    elsif draw?(board)
      nil
    end
  end
end
