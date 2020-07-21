# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    index1 = win_combination[0]
    index2 = win_combination[1]
    index3 = win_combination[2]

    position1 = board[index1]
    position2 = board[index2]
    position3 = board[index3]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return win_combination
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  board.all? { |character| character == "X" || character == "O"}
end

def draw?(board)
  !(won?(board) || full?(board) == false)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  indexes = won?(board)
  if indexes.class == Array
    return board[indexes[1]]
  else
    return nil
  end
end
