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
$result_who_won = " "
def won?(board)
  result_X = WIN_COMBINATIONS.select do |win_combo|
    win_combo.all? do |position|
      board[position].eql?("X")
    end
  end
  result_O = WIN_COMBINATIONS.select do |win_combo|
    win_combo.all? do |position|
      board[position].eql?("O")
    end
  end
  if(result_X[0] == nil && result_O[0] == nil)
    return false
  elsif(result_X[0] == nil)
    $result_who_won = "O"
    return result_O[0]
  elsif(result_O[0] == nil)
    $result_who_won = "X"
    return result_X[0]
  end
end 

def full?(board)
  board.all? do |choice|
    choice.eql?("X") || choice.eql?("O")
  end
end

def draw?(board)
  if(!won?(board) && full?(board))
    return true
  elsif(!won?(board) && !full?(board))
    return false
  elsif(won?(board))
    return false
  end
end

def over?(board)
  if(won?(board) || full?(board) || draw?(board))
    return true
  end
end

def winner(board)
  if(won?(board))
    $result_who_won
  else
    nil
  end
end