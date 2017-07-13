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
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  false
end

def full?(board)
  [0, 1, 2, 3, 4, 5, 6, 7, 8].all? do |index|
    position_taken?(board, index)
  end
end

def draw?(board)
  full?(board) && won?(board) == false
end

def over?(board)
  full?(board) || won?(board) != false
end

def winner(board)
  over?(board) && won?(board) != false ? board[won?(board)[0].to_i] : nil
end
