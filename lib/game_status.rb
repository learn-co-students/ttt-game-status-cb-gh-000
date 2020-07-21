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
  [2,4,6],
]
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    if position_taken?(board,win_index_1) && 
            position_taken?(board,win_index_2) && 
            position_taken?(board,win_index_3)
    
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
    
      if position_1 == position_2 && position_1 == position_3
        # if position_1 == "X" || position_1 == "O"
          return win_combination
        # end
      end
    end
  end
  false
end

def full?(board)
  board.all? {|grid| !(grid.nil? || grid == " ")}
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  end
  false
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
  false
end

def winner(board)
  if !over?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end