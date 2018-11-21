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
  [2,4,6]]

def check_win_combination?(board, player, win_combo)
  win_combo.all? do |position|
    board[position] == player
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(board, 'X', win_combo)
      return win_combo
    elsif check_win_combination?(board, 'O', win_combo)
      return win_combo
    end
  end
    return false
end

def full?(board)
  if board.include?(' ') || board.include?('')
    return false
  else
    return true
  end
end

def draw?(board)
 if !won?(board) && full?(board)
   return true
 end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board) # accepts a board and returns a token
  if !won?(board)
    return nil
  else WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(board, 'X', win_combo)
      return 'X'
    elsif check_win_combination?(board, 'O', win_combo)
      return 'O'
    end
  end
end
end
