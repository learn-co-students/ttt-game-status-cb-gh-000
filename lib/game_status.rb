# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4 ,6]
]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  combo = WIN_COMBINATIONS.select do |combination|
    start = board[combination[0]]
    combination.none?{|index| !position_taken?(board, index) || board[index] != start}
  end
  combo == [] ? false : combo[0]
end

def full?(board)
  !board.any?{|symbol| symbol == "" || symbol == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
    return false
end

def over?(board)
  full?(board) || won?(board) ? true : false
end

def winner(board)
  !won?(board) ? nil : board[won?(board)[0]]
end
