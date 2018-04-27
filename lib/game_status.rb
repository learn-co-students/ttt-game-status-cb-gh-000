# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

# Rows combination win



def won?(board)

  top_row_win = WIN_COMBINATIONS[0]
  middle_row_win = WIN_COMBINATIONS[1]
  bottom_row_win = WIN_COMBINATIONS[2]
  left_collumn_win = WIN_COMBINATIONS[3]
  middle_collumn_win = WIN_COMBINATIONS[4]
  right_collumn_win = WIN_COMBINATIONS[5]
  top_left_diagonal_win = WIN_COMBINATIONS[6]
  bottom_right_diagonal_win = WIN_COMBINATIONS[7]

  if (board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X") ||
    (board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O")
    return  top_row_win
  elsif (board[middle_row_win[0]] == "X" && board[middle_row_win[1]] == "X" && board[middle_row_win[2]] == "X") ||
    (board[middle_row_win[0]] == "O" && board[middle_row_win[1]] == "O" && board[middle_row_win[2]] == "O")
    return  middle_row_win
  elsif (board[bottom_row_win[0]] == "X" && board[bottom_row_win[1]] == "X" && board[bottom_row_win[2]] == "X") ||
    (board[bottom_row_win[0]] == "X" && board[bottom_row_win[1]] == "X" && board[bottom_row_win[2]] == "O")
    return  bottom_row_win
  elsif (board[left_collumn_win[0]] == "X" && board[left_collumn_win[1]] == "X" && board[left_collumn_win[2]] == "X") ||
    (board[left_collumn_win[0]] == "O" && board[left_collumn_win[1]] == "O" && board[left_collumn_win[2]] == "O")
    return  left_collumn_win
  elsif (board[middle_collumn_win[0]] == "X" && board[middle_collumn_win[1]] == "X" && board[middle_collumn_win[2]] == "X") ||
    (board[middle_collumn_win[0]] == "O" && board[middle_collumn_win[1]] == "O" && board[middle_collumn_win[2]] == "O")
    return  middle_collumn_win
  elsif (board[right_collumn_win[0]] == "X" && board[right_collumn_win[1]] == "X" && board[right_collumn_win[2]] == "X") ||
    (board[right_collumn_win[0]] == "O" && board[right_collumn_win[1]] == "O" && board[right_collumn_win[2]] == "O")
    return  right_collumn_win
  elsif (board[top_left_diagonal_win[0]] == "X" && board[top_left_diagonal_win[1]] == "X" && board[top_left_diagonal_win[2]] == "X") ||
    (board[top_left_diagonal_win[0]] == "O" && board[top_left_diagonal_win[1]] == "O" && board[top_left_diagonal_win[2]] == "O")
    return  top_left_diagonal_win
  elsif (board[bottom_right_diagonal_win[0]] == "X" && board[bottom_right_diagonal_win[1]] == "X" && board[bottom_right_diagonal_win[2]] == "X") ||
    (board[bottom_right_diagonal_win[0]] == "O" && board[bottom_right_diagonal_win[1]] == "O" && board[bottom_right_diagonal_win[2]] == "O")
    return  bottom_right_diagonal_win
  else
    return false
  end
end

def full?(board)
  board.all? { |e|  e == "X" || e == "O" }
end

def draw?(board)
  if full?(board) && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif full?(board) && !!won?(board)
    return true
  elsif !!won?(board) && !full?(board)
    return true
  else
    false
  end
end

def winner(board)
  if !!won?(board)
    array = won?(board)
    if array.all? { |e|  board[e] == "X" }
      return "X"
    elsif array.all? { |e|  board[e] == "O" }
      return "O"
    end
  else
    return nil
  end
end
