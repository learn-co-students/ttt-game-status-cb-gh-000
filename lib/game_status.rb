# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS= [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
def won?(board)
    WIN_COMBINATIONS.any? do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      else
        false
      end
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the win_combination indexes that won.
      else
        false
      end
    end
end

def full?(board)
  board.all?{|i| i!=' '}
end


def  draw?(board)
  if full?(board)
    if !won?(board)
      return true
    else
      return false
    end
  end
end

 def over?(board)
   full?(board)||draw?(board)||won?(board)
 end

def winner(board)
  winner=won?(board)
  if winner.class != Array
    return nil
  else
    winner.all? do |i|
    if board[i]=="X"
      return 'X'
    elsif board[i]=='O'
      return 'O'
    end
    end
  end
end
