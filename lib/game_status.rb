# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || place == " ")
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
PLAYER_WON = [
  ["X", "X", "X"],
  ["O", "O", "O"]
]

def won?(board)
  wc = []
  won = false
  WIN_COMBINATIONS.any? do |coomb|
    cc = [board[coomb[0]], board[coomb[1]], board[coomb[2]]]
    wc = coomb
    won = PLAYER_WON.include?(cc)
    won
  end
  if won then
    wc
  else
    false
  end
end

def full?(board)
  board.all?{|space| space != " "}
end

def draw?(board)
  full?(board) && won?(board) == false
end

def over?(board)
  draw?(board) || won?(board) != false
end

def winner(board)
  wc = won?(board)
  if wc == false then
    nil
  else
    coomb = [board[wc[0]], board[wc[1]], board[wc[2]]]
    coomb == PLAYER_WON[0] ? "X" : "O"
  end
end

x_win_diagonal = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
p winner(x_win_diagonal)
