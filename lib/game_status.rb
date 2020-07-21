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

def won?(board)
  f=0
  i=Array.new
  WIN_COMBINATIONS.each do |index|
    win_index_1=index[0]
    win_index_2=index[1]
    win_index_3=index[2]

    position_1=board[win_index_1]
    position_2=board[win_index_2]
    position_3=board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      f=1
      i<<index[0]
      i<<index[1]
      i<<index[2]
      break
    end

  end
  if f!=1
    false
  else
    return  i
  end
end


def full?(board)
  board.all? do |b|
    b == "X" || b == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  p=Array.new
  if won?(board)
    p=won?(board)
    return board[p[0]]
  else
    return nil
  end
end
