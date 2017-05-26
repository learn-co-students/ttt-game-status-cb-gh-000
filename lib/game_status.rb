# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],  # Top
  [3, 4, 5],  # Middle
  [6, 7, 8],  # Bottom

  [0, 3, 6],  # Left
  [1, 4, 7],  # Middle
  [2, 5, 8],  # Right
  
  [0, 4, 8], # Diagonal 1
  [2, 4, 6]  # Diagonal 2
]

def won?(board)

  counter = 0
  
  WIN_COMBINATIONS.each do |win_combo|
    
    pos = win_combo.all? { |index| position_taken?(board, index) }
    
    if pos
      if (win_combo.all? {|index| board[index] == "X"} ||
          win_combo.all? {|index| board[index] == "O"})

        return win_combo
      else
        counter += 1
      end
    end
    
  end # End of WIN_COMBINATIONS
  
  if (counter == 8) || (counter == 0)
    return false
  end
  
end

def full?(board)
  board.all? { |str| str != " " }
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  elsif (!won?(board) && !full?(board))
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if !won?(board)
    return nil
  else
    
    if won?(board).all? { |index| board[index] == "X" }
      return "X"
    elsif won?(board).all? { |index| board[index] == "O" }
      return "O"
    else
      return nil
    end
    
  end
end
