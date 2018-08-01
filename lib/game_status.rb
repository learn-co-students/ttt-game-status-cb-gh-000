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
    [2,4,6]
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| board[index] == "X"}
      return win_combo
    end
    if win_combo.all? {|index| board[index] == "O"}
      return win_combo
    end 
  end
  
  # Reached here => no winning combination detected
  return false
end


def full?(board)
  board.all? { |item | item == "X" || item == "O"}
end


def draw?(board)
  if won?(board)
    return false 
  elsif !full?(board)
    return false 
  else
    return true
  end 
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true 
  end 
  return false 
end 


def winner(board)
  if won?(board)
    won?(board).each {|index| return board[index]}
  end
  return nil
end 