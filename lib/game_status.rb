# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  winning_combo = false
  
  WIN_COMBINATIONS.each do | combo |
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O") 
      return combo
    end
  end

  return false
end


def full?(board)
  return !board.include?(" ")
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end

  return false
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end

  return false
end

def winner(board)
  if over?(board) && !draw?(board)
    winning_combo = won?(board)
    index = winning_combo[0]
    return board[index]
  end

  return nil
end
    
    
    