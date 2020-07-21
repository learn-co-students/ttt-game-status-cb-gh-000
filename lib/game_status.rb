require 'pry'
# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #Horizontal Win Rows
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #Vertical Win Rows
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #Diagonal Win Rows
  [0,4,8],
  [2,4,6]
]
board = [" ", " ", " ", "O", "O", " ", "X", "X", "X"]
def won?(array)
  WIN_COMBINATIONS.detect do |combo|
    if array[combo[0]] == "X" && array[combo[1]] =="X" && array[combo[2]] == "X"

      return combo
    else
      if array[combo[0]] == "O" && array[combo[1]] =="O" && array[combo[2]] == "O"
        return combo
      end
    end
  end
  return false
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
def draw?(array)
   (!(won?(array)) && full?(array))
end

won?(board)
