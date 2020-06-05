# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win|

    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
      break
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return win
      break
    end

  end

    return false
end

def full?(board)
  counter=0
  board.each do |c|
    if c=="X"||c=="O"
      counter+=1
    end
  end
  if counter==9
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else
    false
  end
end

def over?(board)
  if won?(board)
    true
  elsif full?(board)
    true
  else
    false
  end
end



  def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
