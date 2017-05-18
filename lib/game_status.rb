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

# Find the first match, returns the matched win_combination array or nil.
def won? (board)
  WIN_COMBINATIONS.detect do |win_combination|
    # Check if the win_combination is ocupied/not empty.
    valid_win_combination = position_taken?(board, win_combination[0])
    char1 = board[win_combination[0]]
    char2 = board[win_combination[1]]
    char3 = board[win_combination[2]]
    valid_win_combination && char1 == char2 && char2 == char3
  end
end

def full? (board)
  board.all? { |element| element == "X" || element == "O" }
end

def draw? (board)
  full?(board) && !won?(board)
end

def over? (board)
  full?(board) || won?(board)
end

# Returns winner character or nil.
def winner (board)
  result = won?(board)
  # Get first character of the winning combination, if there was any winning combination.
  board[result[0]] if result.class == Array
end
