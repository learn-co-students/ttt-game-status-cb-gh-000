# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # row combinations
  [0,1,2],
  [3,4,5],
  [6,7,8],
  # column combinations
  [0,3,6],
  [1,4,7],
  [2,5,8],
  # diagonal combinations
  [2,4,6],
  [0,4,8]
]

# won?: check to see for a winning combinations
# => board - current board states
# <= win - the winning combination
# <= nil - if there is no winning combination
def won?(board)
  # select the indices containing X
  x_indices = (0..board.size-1).select{|i| board[i] == 'X'}
  o_indices = (0..board.size-1).select{|i| board[i] == 'O'}
  WIN_COMBINATIONS.each do |win|
    if win.to_set.subset?(x_indices.to_set) || win.to_set.subset?(o_indices.to_set)
      return win
    end
  end

  return nil
end

# full?: Check to see if the board is full
# => board - current board state
# <= true - if the board is full
# <= false - if there are still places to place a move
def full?(board)
    return board.all?{|space| space == 'X' || space == 'O'}
end

# draw?: Check to see if the game is a draw
# => board - current board state
# <= true - if the board is full and contains no winning combinations
# <= false - if the board is not full or contains a winning combination
def draw?(board)
  # check if the board is fall
  if(full?(board) == false)
    return false
  end
  if(won?(board) != nil)
    return false
  end
  return true
end

# over?: determine if a game is over
# => board - current board state
# <= true - a winner has been found or a draw has occurred
# <= false - the game is not over
def over?(board)
  if(won?(board) != nil)
    return true
  end
  return draw?(board)
end

# winner: determine if there is a winner and who that winner is
# => board - current board state
# <= "X" - if X is the winner
# <= "O" - if O is the winner
# <= nil - if there is no winner
def winner(board)
  if(over?(board))
    win_combo = won?(board)
    if(win_combo != nil)
      return board[win_combo[0]]
    end
  end
  return nil
end
