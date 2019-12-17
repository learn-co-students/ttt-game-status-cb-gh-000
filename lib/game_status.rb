# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.none?{|input| input == " "}
end

def draw?(board)
  if board.all?{|input| input.downcase == "x" || input.downcase == "o"} && !won?(board)
    return true

  end
end

def over?(board)
  if full?(board) == false && !won?(board)
    return false
  elsif won?(board) == true || full?(board) == false
    return true
  elsif   draw?(board) == true || full?(board) == true || won?(board) == true
    return true
  end
end


def winner(board)

  won?(board)
  if WIN_COMBINATIONS.none? {|win_combination| win_combination == won?(board)}
    return nil
  else
    return board[won?(board)[0]]
    end
  end
