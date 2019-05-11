# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
#horizontal
[0,1,2],
[3,4,5],
[6,7,8],
#vertical
[0,3,6],
[1,4,7],
[2,5,8],
#diagonal
[0,4,8],
[2,4,6]
]

def won? (board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
else
  false
end

def full? (board)
  board.all? do |check_space|
    check_space == "X" || check_space == "O"
  end
end

def draw? (board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end

def over? (board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner (board)
  if won?(board)
    winning_combo = won?(board)
    first = winning_combo[0]
    board[first]
  end
end
