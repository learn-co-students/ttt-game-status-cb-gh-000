# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], # ROW WINS
                    [0,3,6], [1,4,7], [2,5,8], # COLUMN WINS
                    [0,4,8], [2,4,6]] # DIAGONAL WINS

def won?(board)
  WIN_COMBINATIONS.each do |ttt_win|

    win_index_1 = ttt_win[0]
    win_index_2 = ttt_win[1]
    win_index_3 = ttt_win[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return ttt_win
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return ttt_win
    end
  end
  #else
  return false
end # End won(board)


def full?(board)
  board.all? {|square| square == "X" || square == "O"}
end # End full?(board)


def draw?(board)
  if (full?(board) == true && won?(board) == false)
    return true
  else
    return false
  end
end # End draw?(board)


def over?(board)
  if (won?(board) || full?(board) || draw?(board))
    return true
  else
    return false
  end
end # End over?(board)


def winner(board)
  index = []
  index = won?(board)

  if (index == false)
    return nil
  else
    if (board[index[0]] == "X")
      return "X"
    else
      return "O"
    end
  end
end # End winner(board)
