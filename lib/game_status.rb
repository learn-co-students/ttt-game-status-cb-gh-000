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
  WIN_COMBINATIONS.each do |win|
    win_comb_1 = win[0]
    win_comb_2 = win[1]
    win_comb_3 = win[2]
    pos_1 = board[win_comb_1]
    pos_2 = board[win_comb_2]
    pos_3 = board[win_comb_3]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return ([win_comb_1, win_comb_2, win_comb_3])
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return ([win_comb_1, win_comb_2, win_comb_3])
    end
  end
  return false
end

def full?(board)
  board.each do |b|
    if b == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    position = won?(board)[0]
    return board[position]
  end
end
