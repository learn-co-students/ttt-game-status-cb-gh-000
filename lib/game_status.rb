# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(rows)
  if (rows.count{ |i| i == ' '} === 9)
    false
  else
    if (rows[0] == 'X' && rows[1] == 'X' && rows[2] == 'X') || (rows[0] == 'O' && rows[1] == 'O' && rows[2] == 'O')
      return WIN_COMBINATIONS[0]
    elsif (rows[3] == 'X' && rows[4] == 'X' && rows[5] == 'X') || (rows[3] == 'O' && rows[4] == 'O' && rows[5] == 'O')
      return WIN_COMBINATIONS[1]
    elsif (rows[6] == 'X' && rows[7] == 'X' && rows[8] == 'X') || (rows[6] == 'O' && rows[7] == 'O' && rows[8] == 'O')
      return WIN_COMBINATIONS[2]
    elsif (rows[0] == 'X' && rows[3] == 'X' && rows[6] == 'X') || (rows[0] == 'O' && rows[3] == 'O' && rows[6] == 'O')
      return WIN_COMBINATIONS[3]
    elsif (rows[1] == 'X' && rows[4] == 'X' && rows[7] == 'X') || (rows[1] == 'O' && rows[4] == 'O' && rows[7] == 'O')
      return WIN_COMBINATIONS[4]
    elsif (rows[2] == 'X' && rows[5] == 'X' && rows[8] == 'X') || (rows[2] == 'O' && rows[5] == 'O' && rows[8] == 'O')
      return WIN_COMBINATIONS[5]
    elsif (rows[0] == 'X' && rows[4] == 'X' && rows[8] == 'X') || (rows[0] == 'O' && rows[4] == 'O' && rows[8] == 'O')
      return WIN_COMBINATIONS[6]
    elsif (rows[6] == 'X' && rows[4] == 'X' && rows[2] == 'X') || (rows[6] == 'O' && rows[4] == 'O' && rows[2] == 'O')
      return WIN_COMBINATIONS[7]
    else
      return false
    end
  end
end

def full?(board)
  board.count{|i| i != ' '} == 9
end

def draw?(board)
  return true if !won?(board) && full?(board)
  return false unless (won?(board) && full?(board)) || won?(board)
end

def over?(board)
return true if won?(board) || draw?(board) || full?(board)
false
end

def winner(board)
  return nil if board.count('X') == board.count('O')
  board.count('X') > board.count('O') ? 'X' : 'O'

end
