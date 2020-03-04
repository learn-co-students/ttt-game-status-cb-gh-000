# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS = [
  [0,1,2], #1st horizontal row
  [3,4,5], #2nd horizontal row
  [6,7,8], #3rd horizontal row
  [0,3,6], #1st vertical row
  [1,4,7], #2nd vertical row
  [2,5,8], #3rd vertical row
  [0,4,8], #1st diagonal row
  [6,4,2]  #2nd diagonal row
]

def won?(board)
  win = false
  WIN_COMBINATIONS.each do |a_win|
    win_index_1 = a_win[0]
    win_index_2 = a_win[1]
    win_index_3 = a_win[2]

    if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X") or (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      win = a_win
    end
  end
  return win
end

def full?(board)
  board.none? do |cell|
    cell == " "
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board) and !won?(board)
    return true
  elsif !full?(board) and !won?(board)
    return false
  end
end

def over?(board)
  won?(board) or draw?(board) or full?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
