# Helper Method
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

def position_taken(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == "X"  && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O"  && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
      return win_combination
    end
  end
  false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == "X"  && board[win_combination[1]] == "X" && board[win_combination[2]] == "X")
      return "X"
    elsif (board[win_combination[0]] == "O"  && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
      return "O"
    elsif !won?(board)
      return nil
    end
  end
end
