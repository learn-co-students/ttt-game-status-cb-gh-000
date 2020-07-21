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

  WIN_COMBINATIONS.each do |combination|

    combo_value = []

    combination.each do |position|

      if position_taken?(board, position)
        combo_value << board[position]
      end

    end

    if combo_value.size == 3 && combo_value[0] == combo_value[1] && combo_value[1] == combo_value[2] then

      return combination

    end

  end

  false

end

def full?(board)

  result = board.all? do |position_value|
    position_value == "X" || position_value == "O"
  end

end

def draw?(board)

  !won?(board) && full?(board)

end

def over?(board)

  won?(board) || full?(board)

end

def winner(board)

  if won?(board)

    #DBC, assumes won? array 3x same
    if board[won?(board)[0]] == "X"
      "X"
    elsif board[won?(board)[0]] == "O"
      "O"
    else
      nil
    end

  end

end
