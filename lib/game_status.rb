# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # diagonal 1
  [2,4,6], # diagonal 2
  [0,3,6], # vertical 1
  [2,5,8], # vertical 2
  [1,4,7] # vertical 3
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
  !board.any?{|position| position == " " || position == nil}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
   return nil
 end
end
