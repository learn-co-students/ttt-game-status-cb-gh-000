# Helper Method
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
  [2,4,6]
]

def won?(board)
  win = false
  WIN_COMBINATIONS.each do |win_comb|
    win_index_1 = win_comb[0]
    win_index_2 = win_comb[1]
    win_index_3 = win_comb[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      win = win_comb
    end
  end
  return win
end

def full?(board)
  full = true
  i = 0
  while i != 8
    if !position_taken?(board, i)
      full = false
    end
    i = i + 1
  end
  return full
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  result = false
  if draw?(board)
    result = true
  elsif won?(board)
    result = true
  elsif full?(board)
    result = true
  end
  return result
end

def winner(board)
  winner = nil
  result = won?(board)
  if result
    result.each do |i|
      if board[i] == "X"
        winner = "X"
      else
        winner = "O"
      end
    end
  end
  return winner
end
