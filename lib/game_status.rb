# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

def won? (board) 
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && (board[combo[0]] == "X" || board[combo[0]] == "O")
      return combo
    end
  end
  return false
end

def full? (board)
  !board.any? { |place| (place != "X" && place != "O") }
end

def draw? (board)
  full?(board) && !won?(board)
end

def over? (board)
  draw?(board) || won?(board)
end

def winner (board)
  winning = won? board
  if !winning
    return nil
  end
  board[winning[0]]
end
