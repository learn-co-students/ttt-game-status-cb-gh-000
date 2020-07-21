# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,4,8],
  [6,4,2],
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

   position_1 = board[win_index_1] # load the value of the board at win_index_1
   position_2 = board[win_index_2] # load the value of the board at win_index_2
   position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_taken?(board,win_index_1) && position_taken?(board,win_index_2) && position_taken?(board,win_index_3)
        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return win_combination # return the win_combination indexes that won.
        else
          return false
        end
      end
  end
end

def full?(board)
  board.any? do |index|
     " " || "" || false
    end
    return !board.any?{|i| i == " "}
  end

def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif !won?(board) && !full?(board)
     return false
   elsif won?(board)
      return false
    end
  end

  def over?(board)
    if won?(board) || full?(board) && draw?(board)
      return true
      else
      return false
        end
  end
#============================================
  def winner(board)

    if won?(board)
      if board[won?(board)[0]] == "O"
        return "O"
      else
        return "X"
      end
    else
      return nil
    end

  end
