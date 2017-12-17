# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  if board == []
    return false
  elsif board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end
  for win_combination in WIN_COMBINATIONS
    x_matchcount = 0
    o_matchcount = 0
    win_combination.each do |winposition|
      if board[winposition].include?("X")
        x_matchcount += 1
      end
      if board[winposition].include?("O")
        o_matchcount += 1
      end
    end
    if x_matchcount == 3
      return win_combination
    end
    if o_matchcount == 3
      return win_combination
    end
  end

  return false
end

def full?(board)
  full = false
  full = board.none?{|position| position == " "}
end

def draw?(board)
  draw = false
  if won?(board) == false
    if board.none?{|pos| pos == " " || pos == ""}
      draw = true
    end
  end
  return draw
end

def over?(board)
  if won?(board) != false
    return true
  elsif draw?(board) == true
    return true
  elsif full?(board) == true
    return true
  else return false
  end
end

def winner(board)
  winner = nil
  if won?(board) != false
    if board[won?(board)[0]] == "X"
      winner = "X"
    elsif board[won?(board)[0]] == "O"
      winner = "O"
    end
  end
  return winner
end
