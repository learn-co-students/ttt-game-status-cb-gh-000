# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_indexes|
    if board[win_indexes[0]] == 'X' && board[win_indexes[1]] == 'X' && board[win_indexes[2]] == 'X'
      return win_indexes
    elsif board[win_indexes[0]] == 'O' && board[win_indexes[1]] == 'O' && board[win_indexes[2]] == 'O'
      return win_indexes
    else
      false
    end
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if won?(board)
    false
  elsif won?(board) &&  !full?(board)
    false
  else
    true
  end
end

def over?(board)
  if won?(board) || full?(board)
    true
  else
    false
  end
end


def winner(board)
  winner = won?(board)
  if draw?(board) && !over?(board)
    nil
  elsif winner != false
    return board[winner[0]]
  else
    nil
  end
end
