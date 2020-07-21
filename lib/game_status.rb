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
  has_won = false
  WIN_COMBINATIONS.each do |win_combo|
    win_pos_1 = win_combo[0]
    win_pos_2 = win_combo[1]
    win_pos_3 = win_combo[2]

    pos_1 = board[win_pos_1]
    pos_2 = board[win_pos_2]
    pos_3 = board[win_pos_3]

    if position_taken?(board, win_pos_1) && position_taken?(board, win_pos_2) &&
       position_taken?(board, win_pos_3)

       pos_1 = board[win_pos_1]
       pos_2 = board[win_pos_2]
       pos_3 = board[win_pos_3]

       if pos_1 == pos_2 && pos_2 == pos_3
         has_won = win_combo
         break
       end
    end
  end
  has_won
end

def full?(board)
  is_full = board.all? do |square|
    square == "X" || square == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  w = won?(board)
  if w != false
    board[w[0]]
  else
    nil
  end
end
