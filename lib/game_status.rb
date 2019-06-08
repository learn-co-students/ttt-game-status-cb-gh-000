# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]

def won?(board)
  false if board.all? { |e| e == " " or (e != "X" and e != "O")}
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == board[combination[1]] and board[combination[0]] == board[combination[2]]
      return combination if board[combination[0]] != ' '
    end
  end
  false
end

def full?(board)
  board.any? { |e| e == ' ' } ? false : true
end

def draw?(board)
  won = won?(board)
  if won.is_a?(Array)
    return false
  end
  full?(board)
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  end
  false if !full?(board)
end

def winner(board)
  won = won?(board)
  if won.is_a?(Array)
    return board[won[0]]
  end
end
