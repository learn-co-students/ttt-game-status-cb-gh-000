# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def position_taken_by(board, index)
  board[index]
end

def player_winner(board, combination, player)
  combination.all? do |el|
    position_taken?(board,el)
    position_taken_by(board,el)==player
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |c|
    player_winner(board,c,"X") || player_winner(board,c,"O")
  end
end

def full?(board)
  i=0
  board.all? do |el|
    el!=""&&el!=" "&&!el.nil?
  end
end

def draw?(board)
  !(won?(board))&&full?(board)
end

def over?(board)
  won?(board)||full?(board)
end

def winner(board)
  c=won?(board)
  if c&&player_winner(board,c,"X")
    return "X"
  elsif c&&player_winner(board,c,"O")
    return "O"
  else
    return nil
  end
end
