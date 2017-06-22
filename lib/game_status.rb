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
  [6,4,2]
]

def wininfo board
  combination = WIN_COMBINATIONS.find do |combination|
    combination.map do |position|
      board[position]
    end.uniq.size == 1 && board[combination[0]].strip != ''
  end
  {
    combination: combination ? combination : false,
    winner: combination ? board[combination[0]] : nil
  }
end

def won? board
  wi = wininfo board
  wi[:combination]
end

def full? board
  board.size.times.all? do |position|
    position_taken? board, position
  end
end

def draw? board
  !won?(board) && full?(board)
end

def over? board
  full?(board) || won?(board)
end

def winner board
  wi = wininfo board
  p wi[:winner]
end
