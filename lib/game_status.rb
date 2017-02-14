# Helper Method
def position_taken?(board, index)
    if(board[index] == " " || board[index] == "" || board[index] == nil)
        return false
    elsif(board[index] == 'X' || board[index] == 'O')
        return true
    end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]

def won? (board)
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        if (position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3))
            position_1 = board[win_index_1]
            position_2 = board[win_index_2]
            position_3 = board[win_index_3]

            if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
                (position_1 == "O" && position_2 == "O" && position_3 == "O")
                return win_combination
            end
        end
    end
    return nil
end


def full? (board)
    board.all? do |number|
        (number == 'X') || (number == 'O')
    end
end

def draw? (board)
    if(!won?(board) && full?(board))
        return true
    elsif (!won?(board) && !full?(board))
        return false
    elsif won?(board)
        return false
    end
end

def over? (board)
    if (won?(board) || full?(board) || draw?(board))
        return true
    end
end

def winner (board)
    combination = won?(board)
    if combination
        if ( board[combination[0]] == "X" && board[combination[0]] == "X" && board[combination[0]] == "X" )
            return 'X'
        else
            return 'O'
        end
    end
    return nil
end
