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
  WIN_COMBINATIONS.each do |win_combo| # win_combo is same as WIN_COMBINATIONS[0][1][2]
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]]== "X") || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
     return win_combo
    end
    end
    return false
end


def full?(arr)
  arr.all? do |element|
    element == "X" || element == "O"
end
end


def draw?(arr)
  !won?(arr) && full?(arr)
end


def over?(game)
  won?(game) || draw?(game)
end


def winner(board)
  # we have game which will be the board array
  # won?(game) will be either false, or an array (for example: [0,1,2])
  # we can't grab a value of an index for false
  if won?(board)
     board[won?(board)[0]]
  end
end