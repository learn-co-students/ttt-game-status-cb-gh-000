# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],[3, 4, 5],[6, 7, 8],
  [0, 3, 6],[1, 4, 7],[2, 5, 8],
  [0, 4, 8],[2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |comb|
    if (board[comb[0]] == "X" && board[comb[1]] == "X" && board[comb[2]] == "X") || (board[comb[0]] == "O" && board[comb[1]] == "O" && board[comb[2]] == "O")
      return comb
    end
  end
  false
end

def empty?(board)
  board.all? { |token| token == " "}
end

def full?(board)
  board.all? { |token| token == "X" || token == "O"  }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  winner = won?(board)

  if winner

    if board[winner[0]] == "X" && board[winner[1]] == "X" && board[winner[2]] == "X"
      "X"
    else
      "O"
    end

  end
end
