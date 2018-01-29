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
  result = []
  WIN_COMBINATIONS.each do | win_combination |
    win_index_1 = board[win_combination[0]]
    win_index_2 = board[win_combination[1]]
    win_index_3 = board[win_combination[2]]

    if (win_index_1 == "X" && win_index_2 == "X" && win_index_3 == "X") || (win_index_1 == "O" && win_index_2 == "O" && win_index_3 == "O")
      result = win_combination
      break
    end
  end

  result == [] ? false : result
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if (full?(board))
    if(won?(board))
      false
    else
      true
    end
  else
    false
  end
end

def over?(board)
  if (draw?(board))
    true
  elsif won?(board)
    true
  else
    false
  end
end

def winner(board)
  winner = nil
  win_row = won?(board)
  if (win_row != false)
    winner = board[win_row[0]]
  end

  winner
end
