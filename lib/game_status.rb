# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
 WIN_COMBINATIONS.detect do |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

 (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")

end
end

def full?(board)
  board.all? do |board_index|
    (board_index == "X") || (board_index == "O")
end
end

def draw?(board)
    if (full?(board) && !won?(board))
      true
    elsif (!full?(board) && won?(board) == false)
      false
    elsif !won?(board) == false
      false
    else
      false
    end
end

def over?(board)
if (won?(board) || draw?(board) || full?(board))
      true
  else
      false

end
end

def winner(board)
  if won?(board)
    won?(board).each do |winning_index|
      if (board[winning_index] == "X")
        return "X"
      elsif (board[winning_index] == "O")
        return "O"
      else
        return false
      end
    end
  end

end
