# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row
  [0,3,6],  # First column
  [1,4,7],  #Second column
  [2,5,8],  #Third column
  [0,4,8],  #diagonal 1
  [2,4,6]  #diagonal 2
]

def won?(board)
  WIN_COMBINATIONS.each_with_index do |element, index|
    if position_taken?(board, element[0]) == true
      if board[element[0]] == board[element[1]] && board[element[1]] == board[element[2]]
        return WIN_COMBINATIONS[index]
      end
    end
  end
  return false
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board)
    false
  elsif !won?(board) && !full?(board)
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
  if won?(board) != false
    win.each do |index|
      win = board[index]
    end
    win
  else
    nil
  end
end
