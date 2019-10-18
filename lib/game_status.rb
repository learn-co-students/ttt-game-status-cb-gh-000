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

def wonwith?(board, combination)
  return board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && notemptytile?(board[combination[0]])
end

def won?(board)
  WIN_COMBINATIONS.find do |combination|
    wonwith?(board, combination)
  end
end

def notemptytile?(tile)
  return tile != "" && tile != " "
end
def full?(board)
  board.select{|tile| notemptytile?(tile)}.length == 9
end
def draw?(board)
  return !won?(board) && full?(board)
end
def over?(board)
  return full?(board) || won?(board)
end
def winner(board)
  result = WIN_COMBINATIONS.select{ |combination| wonwith?(board, combination) }
  if result[0] == nil
    nil
  else
    board[result[0][0]]
  end
end
