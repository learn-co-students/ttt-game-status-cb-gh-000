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
  [2, 4, 6],
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && (board[win_combination[0]] == "X" || board[win_combination[0]] == "O")
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.each do |cell|
    if cell != "X" && cell != "O"
      return false
    end
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board)
    return true
  elsif full?(board)
    return true
  end
  return false
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  return nil
end
