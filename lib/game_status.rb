# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
]
def won?(board)
  won = false
  WIN_COMBINATIONS.each do |fill|
      if position_taken?(board, fill[0]) && position_taken?(board, fill[1]) && position_taken?(board, fill[2])
        if board[fill[0]] == "X" && board[fill[1]] == "X" && board[fill[2]] == "X"
          won = fill
        elsif board[fill[0]] == "O" && board[fill[1]] == "O" && board[fill[2]] == "O"
          won = fill
        end
      end
  end
  won
end

def full?(board)
  full = true
  board.each do |section|

    if section == " " || section == nil

      full = false
      break
    end
  end
  full
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    if board[won?(board)[0]] == "X" && board[won?(board)[1]] == "X" && board[won?(board)[2]] == "X"
      winner = "X"
    elsif board[won?(board)[0]] == "O" && board[won?(board)[1]] == "O" && board[won?(board)[2]] == "O"
      winner = "O"
    end
  else
    winner = nil
  end
end
