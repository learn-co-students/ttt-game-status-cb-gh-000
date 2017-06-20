# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #toprow
  [3,4,5], #midrow
  [6,7,8], #botrow
  [0,3,6], #leftcol
  [1,4,7], #midcol
  [2,5,8], #rightcol
  [0,4,8], #trbl
  [2,4,6] #tlbr
]

def full?(board)
  !(board.detect{|position| position == " " || position == "" || position == nil})
end

def draw?(board)
  !(won?(board)) && full?(board)
end

winning_player = String.new

def won?(board)
  xwin = Array.new
  owin = Array.new
  index = 0

  board.each do |position|
    if position_taken?(board, index) && position == "X"
      xwin << index
    elsif position_taken?(board, index) && position == "O"
      owin << index
    end
    index+=1
  end

  WIN_COMBINATIONS.each do |winner|
    if (winner & xwin) == winner||(winner & owin) == winner
      return winner
    end
  end

  return false
end

def over?(board)
  won?(board) || draw?(board)
end

XWINS = [
  ["X", " ", " ", " ", "X", " ", " ", " ", "X"],
  [" ", " ", "X", " ", "X", " ", "X", " ", " "],
  ["X", "X", "X", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", "X", "X", "X", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", "X", "X", "X"],
  [" ", "X", " ", " ", "X", " ", " ", "X", " "],
  [" ", " ", "X", " ", " ", "X", " ", " ", "X"],
  ["X", " ", " ", "X", " ", " ", "X", " ", " "]
]

def winner(board)
  xwin = Array.new
  owin = Array.new
  index = 0

  board.each do |position|
    if position_taken?(board, index) && position == "X"
      xwin << index
    elsif position_taken?(board, index) && position == "O"
      owin << index
    end
    index+=1
  end

  WIN_COMBINATIONS.each do |winner|
    if (winner & xwin) == winner
      return "X"
    elsif (winner & owin) == winner
      return "O"
    end
  end

 return nil
end
