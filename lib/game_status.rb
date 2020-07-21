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
  WIN_COMBINATIONS.each do |combo|
    won = check_win_combination(board, combo)
    return won if won
  end
  false
end

def check_win_combination(board, win_combination)
  board_selection = board.select.with_index { |value, index| win_combination.include?(index) }
  win_combination if board_selection.all? { |value| value == "X" } || board_selection.all? { |value| value == "O"}
end

def full?(board)
  count = board.count { |value| value == "X" || value == "O"}
  count == board.size
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def turn_count(board)
  count = 0
  board.each do |cell|
    count += 1 if cell == "X" || cell == "O"
  end
  count
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
