# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Middle row
  [0,3,6], # Top row
  [1,4,7],  # Middle row
  [2,5,8],  # Middle row
  [0,4,8], # Top row
  [2,4,6],  # Middle row
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    winCombo = combo.all? do |index|
      board[index] == "X"
    end
    if winCombo
      return combo
    end
    winCombo = combo.all? do |index|
      board[index] == "O"
    end
    if winCombo
      return combo
    end
  end
  return false
end

def full?(board)
  board.none? {|gameitem| gameitem == " "} #=> true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  if (!won?(board) && !full?(board)) || won?(board)
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  itemList = won?(board)
  if itemList
    return board[itemList[0]]
  else
    return nil
end
end
