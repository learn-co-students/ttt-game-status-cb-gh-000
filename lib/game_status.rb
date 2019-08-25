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
  WIN_COMBINATIONS.each do |win_combination|
    index1 = win_combination[0]
    index2 = win_combination[1]
    index3 = win_combination[2]

    if (board[index1] == "X" && board[index2] == "X" && board[index3] == "X") || (board[index1] == "O" && board[index2] == "O" && board[index3] == "O")
      return win_combination
    end
  end

  return nil
end

def full?(board)

  i = 0

  while i < board.length
    if !position_taken?(board, i)
      return false
    end
    i += 1
  end

  return true
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return full?(board) || won?(board) || draw?(board)
end

def winner(board)
  winning_tiles = won?(board)
  if winning_tiles == nil
    return nil
  end

  if board[winning_tiles[0]] == "X"
    return "X"
  elsif board[winning_tiles[0]] == "O"
    return "O"
  end
end
