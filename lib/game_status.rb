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
  WIN_COMBINATIONS.each do |combo|
    ["X", "O"].each do |mark|
      if combo.all?{|i| board[i] == mark}
        return combo
      end
    end
  end
  return nil
end

def full?(board)
  !board.any? { |e| e == " " }
end

def draw?(board)
  full?(board) && ! won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winner = won?(board)
  if winner
    return board[winner[0]]
  else
    return nil
  end
end
