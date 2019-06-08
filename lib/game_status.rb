# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def won?(board)
  WIN_COMBINATIONS.detect do |win_index|
    position_1 = position_taken?(board,win_index[0]) ? board[win_index[0]] : 1
    position_2 = position_taken?(board,win_index[1]) ? board[win_index[1]] : 3
    position_3 = position_taken?(board,win_index[2]) ? board[win_index[2]] : 1
    position_1 == position_2 && position_2 == position_3
  end
end

def full?(board)
  board.all? do |square|
    square == "X" || square == "O"
  end
end

def draw?(board)
  (!won?(board) && full?(board))
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if over?(board) && !draw?(board)
    return board[won?(board)[0]]
  end
end
