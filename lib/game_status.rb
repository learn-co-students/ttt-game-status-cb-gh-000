# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && (board[combination[0]] == "X" || board[combination[0]] == "O")
      return combination
    end
  end
  false
end

def full?(board)
  if draw?(board)
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif !board.all? {|position| position == "X" || position == "O"}
    return false
  else
    return true
  end
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end
