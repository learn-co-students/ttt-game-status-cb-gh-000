# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row

  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Third column

  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_conbination|
    win_index_1 = win_conbination[0]
    win_index_2 = win_conbination[1]
    win_index_3 = win_conbination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    (position_1 == "X"  && position_2 == "X" && position_3 == "X") ||
    (position_1 == "O"  && position_2 == "O" && position_3 == "O")

  end

end

def full?(board)
    board.all? do |element|
      position_taken?(board, board.index(element))
    end
end

def draw?(board)
  if !!won?(board)
    false
  elsif !(!!won?(board)) && !full?(board)
    false
  elsif full?(board)
    true
  end
end

def over?(board)
    !!won?(board)  || full?(board)
end

def winner(board)
  !!won?(board) ? board[won?(board)[0]] : nil
end
