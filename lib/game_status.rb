# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  #iterate over each item in win combinations
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    end
  end
  false
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  end
end


def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo
    return board[winning_combo[0]]
  end
end
