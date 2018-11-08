# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  winner = []
  WIN_COMBINATIONS.each { |index|
    win_index_1 = index[0]
    win_index_2 = index[1]
    win_index_3 = index[2]
    puts position_1 = board[win_index_1]
    puts position_2 = board[win_index_2]
    puts position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winner = index
      break
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winner = index
      break
    end}
   winner == [] ? false : winner
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  index = won?(board) ? won?(board)[0] : false
  index ? board[index] : nil
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Lower row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal starts from top left corner
  [2,4,6]  # Diagonal starts from top right corner
]
