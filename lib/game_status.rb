# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]

def won?(board)
   won = false
   WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   po_1 = board[win_index_1]
   po_2 = board[win_index_2]
   po_3 = board[win_index_3]
     if po_1=="X" && po_2 == "X" && po_3 == "X"
      return  won = [win_index_1,win_index_2,win_index_3]
    elsif po_1=="O" && po_2 == "O" && po_3 == "O"
      return  won = [win_index_1,win_index_2,win_index_3]
     end
  end
  return won
end

def full?(board)
  return board.all? do |po|
    po == "X" || po =="O"
  end
end
def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    false
  end
end


def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  else return false
  end
end
def winner(board)
   if won?(board)
   won_combination = won?(board)
   won_position = won_combination[0]
    return  board[won_position]
  else
    return   nil
  end
end
