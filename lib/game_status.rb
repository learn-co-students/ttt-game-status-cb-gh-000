# Helper Method
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def won?(board)
    win_combinations = []
    i = 0
  while i < WIN_COMBINATIONS.length do
      win_combinations = WIN_COMBINATIONS[i]
    position_1 = board[win_combinations[0]]
    position_2 = board[win_combinations[1]]
    position_3 = board[win_combinations[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combinations
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combinations
    else
        false
    end
    i += 1
  end
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if won?(board) || full?(board) == false
    false
  else
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    return board[win_combination[0]]
  else
    nil
  end
end
