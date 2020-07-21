# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Right column
  [1,4,7], # Middle column
  [2,5,8], # Left column
  [0,4,8], # Diagonals
  [2,4,6]  # Diagonals
]

def won?(board)
  if board.empty? || !board || board.all? { |e| e == "" || e == " " || !e  }
    return false
  end
  WIN_COMBINATIONS.each do |e|
    temp = board[e[0]]
    temp = nil if temp == " "
    if e.all? { |el| board[el] == temp }
      return e
    end
  end
  nil
end

def full?(board)
  board.all? { |e| ["X", "O"].include?(e.upcase) }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  temp = won?(board)
  return temp ? board[temp[0]] : temp
end
