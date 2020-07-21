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
    [2,4,6]
]

def won?( board )
    WIN_COMBINATIONS.each do |combination|
        # puts "#{combination}\n"
        if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
            return combination
        elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
            return combination
        end
    end
    return false
end

def full?( board )
    board.each do |element|
        if element.nil? || element == " "
            return false
        end
    end
    return true
end

def draw?( board )
    if full?(board)
        # puts won?(board)
        won = if won?(board)!=false
            true
        end

        if won
            return false
        else
            return true
        end
    else
        if won?(board)
            return false
        else
            return false
        end
    end
end

def over?( board )
    if won?(board) || draw?(board) || full?(board)
        return true
    else
        return false
    end
end

def winner(board)
    x_elements = board.select do |element|
        element == "X"
    end
    o_elements = board.select do |element|
        element == "O"
    end
    if won?(x_elements)
        return "X"
    elsif  won?(o_elements)
        return "O"
    end
    return nil
end

#testing area
# Board with winning X in the right diagonal.
# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# puts won?(board) #=> [2,4,6]


# incomplete_board = ["X", " ", "X", "O", " ", "X", "O", " ", "O"]
# full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
# puts full?(incomplete_board)
# puts full?(full_board)


# draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
# puts draw?(draw_board) #=> true
#
#  x_diagonal_won = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]
#  puts draw?(x_diagonal_won) #=> false
#
# incomplete_board = ["X", " ", "X", " ", "X", " ", "O", "O", "X"]
# puts draw?(incomplete_board) #=> false


# draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
# puts over?(draw_board) #=> true
#
# won_board = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]
# puts over?(won_board) #=> true
#
# inprogress_board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]
# puts over?(inprogress_board) #=> false

x_win_diagonal = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
puts winner(x_win_diagonal) #=> "X"

o_win_center_column = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
puts winner(o_win_center_column) #=> "O"

no_winner_board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
puts winner(no_winner_board) #=> nil
