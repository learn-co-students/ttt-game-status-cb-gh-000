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

def won?(board)
  for win_combination in WIN_COMBINATIONS
    pos_1 = board[win_combination[0]]
    pos_2 = board[win_combination[1]]
    pos_3 = board[win_combination[2]]
    if position_taken?(board,win_combination[0]) && pos_1 == pos_2 && pos_2 == pos_3
      return win_combination
    end
  end
  false
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
if !won?(board)
  puts "poo"
end

def full?(board)
  for i in 0..8
    if !position_taken?(board,i)
      return false
    end
  end
  true
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  nil
end
