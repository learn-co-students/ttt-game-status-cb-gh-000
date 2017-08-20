# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2],
[0, 3, 6],
[0, 4, 8],
[1, 4, 7],
[2, 5, 8],
[2, 4, 6],
[3, 4, 5],
[6, 7, 8],
]

def won?(board)
WIN_COMBINATIONS.each do |win|
# returns an array of matching indexes for a win
if win.all?{|y| board[y] == "X"}
return win
elsif win.all?{|y| board[y] == "O"}
return win
end
end
return false # returns false for an empty board / a draw
end

def full?(board)
board.all? do |position|
position == "X" || position == "O"
end
end

def draw?(board)
# true if no winner and board is full
!(won?(board)) && full?(board)
end

def over?(board)
  puts 'is it over?'
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    puts 'no keep going'
    return false
  end
end

def winner(board)
 # returns X when X won, O when O won and nill when no winner
 if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end
