# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if ( board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ) || ( board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O" )
      return combination
    end
  end
  return false
end

def win?(board, char = "X")
    WIN_COMBINATIONS.each do |combination|
      if board[combination[0]] == char && board[combination[1]] == char && board[combination[2]] == char
        return combination
      end
    end
    return false
end

def full?(board)
  !board.any?{|element| element == " " || element == "" || element == nil}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

def winner(board)
  if win?(board, "X")
    return "X"
  elsif win?(board, "O")
    return "O"
  else
    return nil
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
