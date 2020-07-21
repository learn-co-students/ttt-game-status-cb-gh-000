# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.any? do |win|
 #WIN_COMBINATIONS.all? do |win|
        win_pos1=win[0]
        win_pos2=win[1]
        win_pos3=win[2]
        if board[win_pos1]=="X" && board[win_pos2]=="X" && board[win_pos3]=="X" || board[win_pos1]=="O" && board[win_pos2]=="O" && board[win_pos3]=="O"
          return win
        else
          false
        end
    end
end

def full?(board)
  board.all? do |value|
    if value=="X" || value=="O"
      true
    else
      false
    end
  end
end


def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
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
    win=won?board
    return board[win[0]]
  else
    return nil
  end
end
