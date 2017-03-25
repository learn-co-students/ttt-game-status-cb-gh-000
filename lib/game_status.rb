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
  [2,4,6],

]

def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
      if (board[wincombo[0]] == "X" && board[wincombo[1]] == "X" && board[wincombo[2]] == "X") || (board[wincombo[0]] == "O" && board[wincombo[1]] == "O" && board[wincombo[2]] == "O")
        return wincombo
      end
    end
    false
end

def full?(board)
  board.all? do |square|
    square.include?("X") || square.include?("O")
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    true
  end
end

def winner(board)
  wincombo = won?(board)
  if wincombo != false
    return board[wincombo[0]]
  end
  nil
end
