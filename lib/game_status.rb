# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
  [0, 1, 2], # Top rows
  [3, 4, 5], # Middle rows
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]

  # ETC, an array for each win combination
]
#won method
def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]
     position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]
     if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end
# full method
def full?(board)
  (0..8).all? do |i|
    position_taken?(board, i)
  end
end


#draw method
def draw?(board)
  full?(board) && !won?(board)
end
def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
 win = won?(board)
 win ? board[win[0]] : nil
end
