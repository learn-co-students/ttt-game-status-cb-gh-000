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
  [2,4,6],
  [0,4,8]
  ]
  

def won?(board)
  winning_combo = false
  
  WIN_COMBINATIONS.each do |win_array|
    win_array.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
       
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        winning_combo = win_combo 
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        winning_combo = win_combo
      else
        winning_combo = false
      end
    end
  end
  
  return winning_combo
end

   
  
  
  








