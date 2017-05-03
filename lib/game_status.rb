WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left row
  [1,4,7],  # Center row
  [2,5,8],  # Right row
  [0,4,8],  # First diagonal
  [2,4,6]   # Second diagonal
]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    moves = combination.collect { |position| board[position] }.join()
    if moves == "XXX" || moves == "OOO"
      return combination
    end
  end
  false
end

def full?(board)
  !board.any? { |value| value.nil? || value == "" || value == " " }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  combination = won?(board)
  if combination
    board[combination[0]]
  end
end
