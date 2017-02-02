# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end
#        0    1    2    3    4    5    6    7    8
board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,5,8],
  [1,4,7],
  [0,3,6],
  [2,4,6],
  [0,4,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_positions|
    positions = []
    win_positions.each do |check_index|
      if position_taken?(board, check_index)
        positions << check_index
      end
    end
  if positions.count == 3
    if board[positions[0]]  == board[positions[1]] && board[positions[1]] == board[positions[2]]
      return positions
    end
  end
  end
  return false
end

def full?(board)
  board.all? {|element| element == "X" || element == "O"}
end

def draw?(board)
 !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
if winner_positions = won?(board)
  return board[winner_positions[0]]
end
end

result = won?(board)
print result
