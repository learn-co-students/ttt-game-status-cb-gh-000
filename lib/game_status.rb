# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row across
  [3,4,5], #middle row across
  [6,7,8], #last row across
  [0,4,8], #first diagonal
  [2,4,6], #second diagonal
  [1,4,7], #second column top down
  [0,3,6], #first column top down
  [2,5,8] #third column top down
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
  false
end

def full?(board)
  board_state = board.detect{|i| i == "" || i == " " || i.nil?}
  if board_state.nil?
    true
  else
    false
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
  combo = won?(board)
  if combo == false
    return nil
  elsif board[combo[0]] == "X"
    return "X"
  elsif board[combo[0]] == "O"
    return "O"
  end
end
