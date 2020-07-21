# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],
  [2,5,8],[0,4,8],[6,4,2]
]
@winner = nil

def won? board
  WIN_COMBINATIONS.each do |win_combination|
    x_wins = win_combination.all? do |index|
      board[index] == "X"
    end
    if x_wins
      @winner = "X"
      return win_combination
    end
    o_wins = win_combination.all? do |index|
      board[index] == "O"
    end
    if o_wins
      @winner = "O"
      return win_combination
    end
  end
  return false
end

def full? board
  board.all?{|position| position == "X" || position == "O"}
end

def draw? board
  !(won?(board)) && full?(board)
end

def over? board
  draw?(board) || won?(board)
end

def winner board
  won? board
  @winner
end
