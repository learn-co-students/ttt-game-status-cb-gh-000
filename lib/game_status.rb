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
  [2,5,8],
  [1,4,7],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |com|
    i1 = com[0]
    i2 = com[1]
    i3 = com[2]
    char = board[i1]
    if position_taken?(board,i1) and position_taken?(board,i2) and position_taken?(board,i3) then
      if board[i2]==char and board[i3]==char then
        return com
      end
    end
  end
  return false
end

def full?(board)
  board.none?{|i| i==" "}
end

def draw?(board)
  won?(board) ? false : true
end

def over?(board)
  full?(board) ? true : false
end

def winner(board)
  pos = won?(board)
  pos ? board[pos[0]] : nil
end
