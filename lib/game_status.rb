# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5],
  [6,7,8], [0,3,6],
  [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]

board = ["X", "X", "X", "X", " ", "X", "O", "O", "X"]

def won?(board)
  if(board[0] == board[1] && board[0] == board[2] && position_taken?(board, 0))
    return WIN_COMBINATIONS[0]
  end
  if(board[3] == board[4] && board[3] == board[5] && position_taken?(board, 3))
    return WIN_COMBINATIONS[1]
  end
  if(board[6] == board[7] && board[6] == board[8] && position_taken?(board, 6))
    return WIN_COMBINATIONS[2]
  end
  if(board[0] == board[3] && board[0] == board[6] && position_taken?(board, 0))
    return WIN_COMBINATIONS[3]
  end
  if(board[1] == board[4] && board[1] == board[7] && position_taken?(board, 1))
    return WIN_COMBINATIONS[4]
  end
  if(board[2] == board[5] && board[2] == board[8] && position_taken?(board, 2))
    return WIN_COMBINATIONS[5]
  end
  if(board[0] == board[4] && board[0] == board[8] && position_taken?(board, 0))
    return WIN_COMBINATIONS[6]
  end
  if(board[2] == board[4] && board[2] == board[6] && position_taken?(board, 2))
    return WIN_COMBINATIONS[7]
  end
  if board.all? { |position| position == " " }
    return false
  end
  return false
end

def full?(board)
  if board.all? { |position| position != " "}
    return true
  end
end

def draw?(board)
  if(won?(board) == WIN_COMBINATIONS[0])
    return false
  end
  if(won?(board) == WIN_COMBINATIONS[6] || won?(board) == WIN_COMBINATIONS[7])
    return false
  end
  if board.all? { |position| position != " "}
    return true
  end
end

def over?(board)
  if board.all? {|position| position != " "} && won?(board) != false
    return true
  end
  if board.any? {|position| position == " "} && won?(board) != false
    return true
  end
  if board.any? {|position| position == " "}
    return false
  end
  if(board.all? {|position| position != " "})
    return true
  end
end

def winner(board)
  if won?(board) != false
    won_line = won?(board)
    return board[won_line[0]]
  else
    return nil
  end
end

display_board(board)
puts winner(board)
