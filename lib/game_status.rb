
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
    ent = []
    board.select do |i|
      if i == " "
        ent << i
      end
      end
      if ent.length == 9
        return false
      end

      WIN_COMBINATIONS.each do |win_combo|
        index1 = win_combo[0]
        index2 = win_combo[1]
        index3 = win_combo[2]
        if board[index1] == "X" && board[index2] == "X" && board[index3] == "X"
          return win_combo
        end
        if board[index1] == "O" && board[index2] == "O" && board[index3] == "O"
          return win_combo
        end
      end

else
  return false


end



def full?(board)

  if board.all?{|i| i != " "}
    return true
  else
    return false
  end


end

def draw?(board)
  if board.all?{|i| i != " "} && !(won?(board))
    return true
  end
  if won?(board)
    return false
  end
  if !(won?(board)) && board.any?{|e| e == " "}
    return false
  end
end


def over?(board)
  if won?(board) || full?(board)
    return true
  end
end

def winner(board)

if !(won?(board))
  return nil
end

if won?(board)
  return board[won?(board)[0]]
else
  return nil
end

end
