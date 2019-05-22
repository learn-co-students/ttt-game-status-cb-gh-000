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
def won? (board)
  WIN_COMBINATIONS.each do |combination|
    if ((board[combination[0]] == "X") && (board[combination[1]] == "X") && (board[combination[2]] == "X"))
      puts combination.inspect
      return combination
    elsif ((board[combination[0]] == "O") && (board[combination[1]] == "O") && (board[combination[2]] == "O"))
      puts combination.inspect
      return combination
    end
  end
  false
end


def full? (board)
  counter = 0
  board.each do |square|
    if ((square == "X") || (square == "O"))
      counter+=1
    end
  end
  if counter > 8
    return true
  else
    return false
  end
end

def draw? (board)
  if full?(board) && !won?(board)
    return true
  end
end


def over? (board)
  if draw?(board) || won?(board)
    true
  end
end

def winner(board)

  win = won?(board)
  if win == false
    return nil

  elsif board[win[0]] == "X"
    return "X"

  elsif board[win[0]] == "O"
    return "O"
  end
end
