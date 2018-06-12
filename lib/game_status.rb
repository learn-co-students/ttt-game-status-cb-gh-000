# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], #vertical
                    [3,4,5], #vertical
                    [6,7,8], #vertical
                    [0,3,6], #horizontal
                    [1,4,7], #horizontal
                    [2,5,8], #horizontal
                    [0,4,8], #diagonal
                    [2,4,6]] #diagonal
  def won?(board)
    WIN_COMBINATIONS.each do |combination| #each combination
      index_1= combination[0]              #saves its in board indexes
      index_2= combination[1]
      index_3= combination[2]

      if(board[index_1] =="X" && board[index_2] =="X" && board[index_3] =="X" ||
         board[index_1] =="O" && board[index_2] =="O" && board[index_3] =="O")
        return  combination
      end
    end
    return nil
  end

  def full? (board)    #check if all board positions are full
    board.each do |p|
      if(p== " ")
        return false
      end
    end
    return true
  end

  def draw?(board)
    if (full?(board) && !won?(board))
      return true
    else
      return false
    end
  end

  def over?(board)
    if(won?(board))
      return true
    elsif  (draw?(board))
      return true
    else
      return false
    end
  end

  def winner(board)
    if (won?(board))
      return  board[won?(board)[0]]
    else
      return nil
    end
  end
