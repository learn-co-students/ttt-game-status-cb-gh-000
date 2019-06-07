# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # top-left to bottom-right diagonal
  [2, 4, 6], # top-right to bottom-left diagonal
]

def won?(board)
  return_array = []
  WIN_COMBINATIONS.each do |win_comb_array|
    if board[win_comb_array[0]] == 'X' && board[win_comb_array[1]] == 'X' && board[win_comb_array[2]] == 'X'
      win_comb_array.each {|win_index| return_array << win_index}
    elsif board[win_comb_array[0]] == 'O' && board[win_comb_array[1]] == 'O' && board[win_comb_array[2]] == 'O'
      win_comb_array.each {|win_index| return_array << win_index}
    end
  end
  if return_array != []
    return return_array
  else
    return false
  end
end

def full?(board)
  board.all? {|position| position == 'X' || position == 'O'}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  winning_combination = won?(board)
  if won?(board)
    return board[winning_combination[0]]
  else
    return nil
  end
end
