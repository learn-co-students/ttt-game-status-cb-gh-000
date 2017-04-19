# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  wins=Array.new
  none=Array.new

  if !board.all?{|i| i==" "}
    WIN_COMBINATIONS.each do |index|
   values=board.values_at(index[0],index[1],index[2])

    if values.all?{|val| val=="X"}|| values.all?{|val| val=="O"}
        wins<<[true,index]
    else none<<false
    end
    end
    if none.length == 8
        return false
      elsif wins[0][0]
          return wins[0][1]
      end
  else
    return false
end
end


def full?(board)
  return board.none?{|item| item==" "}
end

def draw?(board)
    return !won?(board) && full?(board)
end

def over?(board)
   return won?(board) || draw?(board) || full?(board)
end
def winner(board)
   index=won?(board)
   if index
      values=board.values_at(index[0],index[1],index[2])
   if values.all?{|val| val=="X"}
     return "X"
   elsif values.all?{|val| val=="O"}
     return "O"
   end
   else return nil
  end
end
