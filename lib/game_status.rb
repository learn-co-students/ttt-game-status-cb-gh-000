# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_positions = [board[win_combination[0]], board[win_combination[1]], board[win_combination[2]]]
    if win_positions == ["X","X","X"] || win_positions == ["O","O","O"]
      return win_combination
    end
  end
  return false
end

def full?(board)
  return !board.detect{|i| i == " "}
end

def draw?(board)
  return won?(board) == false && full?(board) == true
end

def over?(board)
  return won?(board) == true || full?(board) == true || draw?(board) == true
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
   return nil
 end
end
