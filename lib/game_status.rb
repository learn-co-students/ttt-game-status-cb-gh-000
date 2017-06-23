# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

# Define your WIN_COMBINATIONS constant
def won?(board)
  WIN_COMBINATIONS.detect {|combination|
    board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && (position_taken?(board,combination[0]))
  }

end

def full?(board)
  board.all? {|element|
    element == 'O' || element == 'X'
  }
end

def draw?(board)
  if full?(board)
    !won?(board)
  end
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
