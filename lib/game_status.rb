# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],   # Top row
  [3, 4, 5],   # Middle row
  [6, 7, 8],   # End row
  [0, 3, 6],   # Left column
  [1, 4, 7],   # Middle column
  [2, 5, 8],   # Right column
  [0, 4, 8],   # \ Diaganol
  [2, 4, 6]    # / Diaganol
]

def won?(board)
  return_value = WIN_COMBINATIONS.select do
    |win_combination|

    flag = true
    num_x = 0
    num_o = 0
    i = 0
    while i < win_combination.size && flag
      if board[win_combination[i]].eql?("X") && num_o == 0
        num_x += 1
      elsif board[win_combination[i]].eql?("O") && num_x == 0
        num_o += 1
      else
        flag = false
      end

      i += 1
    end

    num_x == 3 || num_o == 3
  end

  return_value.size > 0 ? return_value[0] : false
end

def full?(board)
  board.all? { |e| (e.eql?("X") || e.eql?("O")) }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  champion = won?(board)

  if champion
    x_or_y = board[champion[0]]
  end
end
