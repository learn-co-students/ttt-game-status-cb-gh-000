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
  [2,4,6]
]

def won?(board)
  temp = false
  WIN_COMBINATIONS.each do |row|
    win_index_1 = row[0]
    win_index_2 = row[1]
    win_index_3 = row[2]
    if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X")
      temp = row
    elsif(board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      temp = row
    end
  end
  temp
end

def full?(board)
 full = true
 board.each do |val|
   if (val.nil? || val == " " || val == "")
      full = false
    end
 end
 full
end

def draw?(board)
  temp = true
  (full?(board) && !won?(board)) ? temp : temp = false
end


def over?(board)
  if (won?(board) || draw?(board))
    true
  else
    false
  end
end

def winner(board)
  val = nil
  if (won?(board))
    temp = won?(board)
    val = board[temp[0]]
  end
end
