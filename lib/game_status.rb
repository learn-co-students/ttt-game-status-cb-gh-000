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
  WIN_COMBINATIONS.each do |win_combo| 

    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_taken_1 = board[win_index_1]
    position_taken_2 = board[win_index_2]
    position_taken_3 = board[win_index_3]

    if position_taken?(board, win_index_1) # check at least one position isn't an empty cell
      if position_taken_1 == position_taken_2 && position_taken_2 == position_taken_3
        return win_combo
      else
        false
      end  
    end
  end
  false
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else 
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true    
  else
    false 
  end
end

def winner(board)
  winning_positions = won?(board)
  if winning_positions != false
    board[winning_positions[0]]
  else
    nil
  end
end