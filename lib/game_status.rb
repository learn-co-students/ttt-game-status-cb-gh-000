# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #Vertical Wins #ROWS
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #Horizontal Wins #COLUMNS
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #Diagonal Wins
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    if board[win_combination[0]] == "X" &&  board[win_combination[1]]  == "X" &&  board[win_combination[2]]  == "X"
      return win_combination
    elsif board[win_combination[0]] == "O" &&  board[win_combination[1]]  == "O" &&  board[win_combination[2]]  == "O"
      return win_combination
    else
      false
    end
  end
  false
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
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
    index = won?(board)
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end
