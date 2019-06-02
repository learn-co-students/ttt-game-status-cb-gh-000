# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do | win_comb |
    flag = win_comb.all?{ |s| board[s] == "X"}
    if flag
      return win_comb
    end
    flag = win_comb.all?{|s| board[s]=="O"}
    if flag
      return win_comb
    end
  end
  return false
end

def full?(board)
  return board.all?{|el| !(el==nil || el == " ")}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board)||won?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do | win_comb |
    flag = win_comb.all?{ |s| board[s] == "X"}
    if flag
      return "X"
    end
    flag = win_comb.all?{|s| board[s]=="O"}
    if flag
      return "O"
    end
  end
  return nil
end
