# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row 
  [0, 3, 6], #First Column
  [1, 4, 7], #Second Column
  [2, 5, 8], #Third Column
  [0, 4, 8], #First Diagonal
  [2, 4, 6] #Second Diagonal
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if (combination.all? {|pos| board[pos] == "X"})
      return combination
    elsif (combination.all? {|pos| board[pos] == "O"})
      return combination
    end
  end
  return false
end

def full?(board)
  return (board.all? {|mark| mark == "X" || mark == "O"})

end

def draw?(board)
  return (full?(board) && won?(board) == false)
end

def over?(board)
  return (won?(board) || draw?(board) || full?(board))
end

def winner(board)
  return won?(board) ? board[won?(board)[0]] : nil
end