# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS  = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

# WON? method
def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
            (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combination
        end
    end
    return false
end

# full? method
def full?(board)
  board.none?{ |postion|  postion == " " || postion == nil }
end

# draw? method
def draw?(board)
  !won?(board) && full?(board)
end

# over? method
def over?(board)
  draw?(board) || won?(board)
end

# winner method
def winner(board)
  return won?(board) ? board[won?(board)[0]] : nil
end
