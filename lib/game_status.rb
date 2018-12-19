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
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    if (board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3]) && board[win_index_1] != " "
      return combo
    end
  end
  nil
end

def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  if won?(board) || !full?(board)
    false
  else
    true
  end
end

def over?(board)
  if full?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  winner = won?(board)
  if winner != nil
    winner_index = winner[0]
    return board[winner_index]
  end
  nil
end
