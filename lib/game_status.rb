# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first c
  [1,4,7], #second c
  [2,5,8], #third c
  [0,4,8], #left right diagonal
  [2,4,6] #right left diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    symbol = position_1

    if position_1.eql?(symbol) && position_2.eql?(symbol) && position_3.eql?(symbol) && position_taken?(board, win_index_1)
      return win_combination # return the win_combination indexes that won.
    end
  end
  return false
end

def full?(board)
  full = true
  i = 0
  board.each do
    if !position_taken?(board, i)
      full = false
    end
    i += 1
  end
  return full
end

def draw?(board)
  draw = false
  if !won?(board) && full?(board)
    draw = true
  end
  return draw
end

def over?(board)
  over = false
  if won?(board) || draw?(board) || full?(board)
    over = true
  end
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    symbol = board[win_combination[0]]
    return symbol
  end
  return nil
end
