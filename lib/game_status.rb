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
  [6,4,2]
]

def won?(board)
  winning_arr = []
  WIN_COMBINATIONS.each do |arr|
    if board[arr[0]] != " " && board[arr[0]] == board[arr[1]] && board[arr[1]] == board[arr[2]]
      winning_arr.push(arr[0]).push(arr[1]).push(arr[2])
    end
  end

  if winning_arr == []
    false
  else
    winning_arr
  end
end

# board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  def full?(board)
    if board.select{|i| i == " "}.length == 0
      true
    end
  end

# board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  def draw?(board)
    if won?(board) == false && full?(board)
      true
    end
  end

def over?(board)
  if draw?(board) || won?(board)
    true
  end
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end
