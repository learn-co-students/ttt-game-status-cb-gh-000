# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0 , 1 , 2],
  [3 , 4 , 5],
  [6 , 7 , 8],
  [0 , 3 , 6],
  [1 , 4 , 7],
  [2 , 5 , 8],
  [0 , 4 , 8],
  [2 , 4 , 6]
]

def won?(board)
  WIN_COMBINATIONS.each { |e| 
      if (e.all? { |i| board[i] == "X" }) || (e.all? { |i| board[i] == "O" })
        return e
      end
   }
   false
end

def full?(board)
  (board.select { |e| e == "X" || e == "O" }).length == 9
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  i = won?(board)
  i ? board[i[0]] : nil
end