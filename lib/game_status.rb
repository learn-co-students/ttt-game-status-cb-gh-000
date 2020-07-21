# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # row wins
  [3,4,5],
  [6,7,8],
  [0,3,6], # column wins
  [1,4,7],
  [2,5,8],
  [0,4,8], # horizontal wins
  [2,4,6]
]

def won?(board)
  # initalise win status
  win_status = nil

  WIN_COMBINATIONS.each do |win_combination|
    # check if all positions are occupied
    win_positions_occupied = win_combination.all?{|position| position_taken?(board, position)}

    if win_positions_occupied
      # identify player
      player = board[win_combination[0]]

      # check if all positions are occupied by player
      if win_combination.all?{|position| board[position] == player}
        win_status = win_combination
        break
      end
    end
  end
  win_status
end

def full?(board)
  board.none?{|position| position == " " }
end

def draw?(board)
  full?(board) && (won?(board) == nil)
end

def over?(board)
  draw?(board) || (won?(board) != nil)
end

def winner(board)
  win_status = won?(board)
  if win_status != nil
    return board[win_status[0]]
  end
  return nil
end
