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
  WIN_COMBINATIONS.any? {|win_combo|
    if (win_combo.all? {|matching| board[matching] == "X"}) or (win_combo.all? {|matching| board[matching] == "O"})
      return win_combo
#    elsif win_combo.all? {|matching| board[matching] == "O"}
#      return win_combo
    else
      false
    end}
end

def full?(board)
  if board.detect {|checkposition| checkposition == " " or checkposition == nil}
    false
  else
    true
  end
end

def draw?(board)
  win_in_this_case = [
    [0,1,2],
    [0,4,8],
    [2,4,6]]
  if board.detect {|checkposition| checkposition == " " or checkposition == nil}
    return false
  elsif win_in_this_case.any? {|win_combo|
    if (win_combo.all? {|matching| board[matching] == "X"}) or (win_combo.all? {|matching| board[matching] == "O"})
      return false
    end}
  elsif won?(board) == false
    return true
  else
    puts "The board state is not included in this method!"
  end
end

def over?(board)
  if won?(board).class == Array or draw?(board) == true
    return true
  elsif full?(board) == false
    return false
  end
end

def winner(board)
  if won?(board).class != Array
    return nil
  else
    return board[won?(board)[0]]
  end
end
