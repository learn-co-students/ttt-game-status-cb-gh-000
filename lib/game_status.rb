# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
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
  board_empty = board.all? {|element| element == " "}
  result_array = nil
  if board_empty
    return nil
  else
    WIN_COMBINATIONS.each do |win_combination|
      winning_positions_taken = position_taken?(board, win_combination[0]) &&
                                position_taken?(board, win_combination[1]) &&
                                position_taken?(board, win_combination[2])

      if winning_positions_taken
        # All Xs
        all_Xs = (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X")

        # All Os
        all_Os = (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")

        if all_Xs || all_Os
          result_array = win_combination
        end
      end
    end
  end
  return result_array
end

def full?(board)
    return !board.include?(" ")
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !full?(board) && !won?(board)
    return false # for in-progress game
  elsif won?(board)
    return false
  # else
  #   return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
