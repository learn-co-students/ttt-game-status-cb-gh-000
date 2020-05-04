# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def won?(board)
if estado = board.all? { |estado| estado==" "}
  false
else
  WIN_COMBINATIONS.any? do |grupo|
    if board[grupo[0]] != " " && board[grupo[0]] == board[grupo[1]] && board[grupo[1]] == board[grupo[2]]
      return grupo
    else
      false
    end
  end
end
end

def full?(board)
  WIN_COMBINATIONS.any? do |grupo|
    if board[grupo[0]] != " " && board[grupo[0]] == board[grupo[1]] && board[grupo[1]] == board[grupo[2]]
    else
      if board.include?(" ")
        false
      else
        true
      end
    end
  end
end

def draw?(board)
  WIN_COMBINATIONS.any? do |grupo|
    if board[0] != " " && board[0] == board[1] && board[1] == board[2]
      false
    elsif board[0] != " " && board[0] == board[4] && board[4] == board[8]
      false
    else
      if board.include?(" ")
        false
      else
        true
      end
    end
  end

end

def over?(board)
  WIN_COMBINATIONS.any? do |grupo|
    if board[grupo[0]] != " " && board[grupo[0]] == board[grupo[1]] && board[grupo[1]] == board[grupo[2]] && board.include?(" ") == true
      true
    else
      if board.include?(" ")
        false
      else
        true
      end
    end
  end

end

def winner(board)
  if won?(board) != false && won?(board) != []
    if board[won?(board)[1]] == "X"
      "X"
    elsif board[won?(board)[1]] == "O"
      "O"
    end
  else
    nil
  end
end
