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
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

  pos1 = board[win_index_1]
  pos2 = board[win_index_2]
  pos3 = board[win_index_3]

  if pos1 == "X" && pos2 == "X" && pos3 == "X"
    return win_combination
  elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
    return win_combination
    end
  end
return false
end

def full?(board)
  board.each do |token|
    if token != "X" && token != "O"
      return false
    end
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  win_indexes = won?(board)
  if win_indexes == false
    return nil
  else
    return board[win_indexes[0]]
  end
end
