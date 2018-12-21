# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # Horizontal Wins
  [0,1,2],
  [3,4,5],
  [6,7,8],
  # Vertical Wins
  [0,3,6],
  [1,4,7],
  [2,5,8],
  # Diagonal Wins
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.find do |win|
    if board[win[0]] != "" && board[win[0]] != " " && board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]]
      return win
    end
  end
end

def full?(board)
  board.none? { |space| space == "" || space == " " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  winner = won?(board)
	  if winner != nil
	    winner_index = winner[0]
	    return board[winner_index]
	  end
end
