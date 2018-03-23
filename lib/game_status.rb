# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant, all possible winning scenarios
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    #win_index_1 = win_combination[0]
    #win_index_2 = win_combination[1]
    #win_index_3 = win_combination[2]
    #position_1 = board[win_combination[0]]
    #position_2 = board[win_combination[1]]
    #position_3 = board[win_combination[2]]

    win_x = win_combination.all? do |positionx|
      board[positionx] == "X"
    end
    win_o = win_combination.all? do |positiono|
      board[positiono] == "O"
    end
    if win_x == true || win_o == true
      return win_combination
    end
  end
  if board.all? { |empty| empty == " " || empty.nil?}
    false
  else
    false
  end
end

def full?(board)
  board.all? { |full| full == "X" || full == "O" }
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) != false
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    win_combo = won?(board)
    if board[win_combo[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
