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
  WIN_COMBINATIONS.each do |combinations|
    if (board[combinations[0]] == 'X' && board[combinations[1]] == 'X' && board[combinations[2]] == 'X') || (board[combinations[0]] == 'O' && board[combinations[1]] == 'O' && board[combinations[2]] == 'O')
      return combinations
    end
  end
  false
end

def full?(board)
  !board.include?(" " || "" || nil)
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board) || (!won?(board) && !full?(board))
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  winner = won?(board)
  if winner == false
    return nil
  elsif board[winner[0]] == 'X'
    return 'X'
  elsif board[winner[0]] == 'O'
    return 'O'
  end
end
