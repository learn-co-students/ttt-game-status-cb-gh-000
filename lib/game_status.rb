# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top Row
  [3,4,5],  # Middle Row
  [6,7,8],  # Bottom Row
  [0,3,6],  # First Column
  [1,4,7],  # Second Column
  [2,5,8],  # Third Column
  [0,4,8],  # TR to BL
  [2,4,6]   # TL to BR
]

def won?(board)
  WIN_COMBINATIONS.detect do |group|
    win_index_1 = group[0]
    win_index_2 = group[1]
    win_index_3 = group[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
    (position_1 == "O" && position_2 == "O" && position_3 == "O")
  end
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    combo = won?(board)
    board[combo[0]]
  else
    return nil
  end
end
