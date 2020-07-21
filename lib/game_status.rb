# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  #display_board(board)
  #returns false for an empty board


  WIN_COMBINATIONS.each do |win_combination|
    #puts "win_combination: #{win_combination}"
    position_1 = board[win_combination[0]]
    #puts "position_1: #{position_1}"
    position_2 = board[win_combination[1]]
    #puts "position_2: #{position_2}"
    position_3 = board[win_combination[2]]
    #puts "position_3: #{position_3}"

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      #puts "here is a winner #{win_combination}"
      return win_combination
      break
    end
  end
  return false
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



def full?(board)
  !board.any? do |element|
    element == " "
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board) != false
        return board[won?(board)[0]]
  else
    return nil
  end
end
