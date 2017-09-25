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

]


def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if position_taken?(board,combination[0]) && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
      return combination
    end
  end

  return nil
end

def full?(board)
  board.all? do |element|
    element == "X" || element =="O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    end
end
