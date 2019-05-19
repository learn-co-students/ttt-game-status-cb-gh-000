# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],  # Diagonal right
  [2,4,6] # Diagonal left
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    # print "#{win_combination}\n"
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    # print "These are the current positions: #{position_1}, #{position_2}, #{position_3}\n"

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      # print "These are the current positions: #{position_1}, #{position_2}, #{position_3}\n"
      return win_combination # return the win_combination indexes that won.
    else
      false
    end
  end
  false
end

def full?(board)
  i = 0
  while i < board.size
    if !position_taken?(board, i)
      false
      break
    end
    i += 1
  end
  i == 9 ? true : false
end

def draw?(board)
  if !full?(board)
    false
  end
  if !won?(board) == false
    false
  else
    full?(board)
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    print win_combination
    return board[win_combination[0]]
  else
    return nil
  end
end

# Board with winning X in the top row.
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

print won?(board) #=> [0,1,2]
puts

draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
puts "Is this a win? Should be false: #{won?(draw_board)}"
puts "This should be a draw #{draw?(draw_board)}" #=> true

x_diagonal_won = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]
puts "This shouldn't be a draw #{draw?(x_diagonal_won)}" #=> false

puts full?(board)

full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
puts full?(full_board) #=> true

incomplete_board = ["X", " ", "X", " ", "X", " ", "O", "O", "X"]
puts draw?(incomplete_board) #=> false

draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
puts over?(draw_board) #=> true

won_board = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]
puts over?(won_board) #=> true

inprogress_board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]
puts over?(inprogress_board) #=> false

x_win_diagonal = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
puts winner(x_win_diagonal) #=> "X"

o_win_center_column = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
puts won?(o_win_center_column)
puts winner(o_win_center_column) #=> "O"

no_winner_board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
puts winner(no_winner_board) #=> nil
