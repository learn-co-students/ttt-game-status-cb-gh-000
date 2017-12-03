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
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
      return win_combination
    elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.each do |position|
    if !(position == 'X' || position == 'O')
      return false
    end
  end
  return true
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    return board[win_combination[0]]
  else
    return nil
  end
end
