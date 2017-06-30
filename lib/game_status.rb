# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
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
     WIN_COMBINATIONS.each do |combination|
       win_index_1 = combination[0]
       win_index_2 = combination[1]
       win_index_3 = combination[2]
       if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
         return combination
       elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
         return combination
       end
     end
     return false
   end

def full?(board)
  board.all? do |i|
    if i == " " || i.nil?
      false
    else
      true
    end
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  win_array = won?(board)
  if !won?(board)
    return nil
  elsif board[win_array[0]] == "X"
    return "X"
  else
    return "O"
  end
end
