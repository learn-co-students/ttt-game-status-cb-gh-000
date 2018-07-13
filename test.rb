WIN_COMBINATIONS = [
  [0,1,2], #top row  #0
  [3,4,5], #middle row #1
  [6,7,8], #bottom row #2
  [0,3,6], #left column #3
  [1,4,7], #middle column #4
  [2,5,8], #right column #5
  [0,4,8], #left to right diagonal #6
  [2,4,6]  #right to left diagonal #7
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
      if ( board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" || board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O" )
        puts "The winning combination is: #{win_combination}"
        puts "The winning symbol is: #{board[win_combination[0]]}"
      else
        false
      end
    end
end

def full?(board)
  !board.any?{|empty| empty == "" || empty == " " || empty == nil }
end


board = ["", "X", "O", "X", "X", "X", "X", "X", "O"]
full?(board)
