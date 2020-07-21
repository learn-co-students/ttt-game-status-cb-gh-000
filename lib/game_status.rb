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
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]

    if (pos_1 == "X" and pos_2 == "X" and pos_3 == "X") or
       (pos_1 == "O" and pos_2 == "O" and pos_3 == "O")
       return combo
    end
  end
  return false
end

def full?(board)
  board.each do |space|
    if space != "X" and space != "O"
      return false
    end
  end
  return true
end

def draw?(board)
  if !won?(board) and full?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board) or draw?(board) or full?(board)
    return true
  end
  return false
end

def winner(board)
  if draw?(board)
    return nil
  end
  if over?(board)
    win_combo = won?(board)
    return board[win_combo[0]]
  end
end