# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def won?(board)
    WIN_COMBINATIONS.each do |i|
        win_index_1 = i[0]
        win_index_2 = i[1]
        win_index_3 = i[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return i
        else
            false
        end
    end
    return false
end

def full?(board)
    return !board.any?{|i| i == " "}
end

def draw?(board)
    return (!won?(board) && full?(board))
end

def over?(board)
    return won?(board) || draw?(board) || full?(board)
end

def winner(board)
    if(won?(board))
        WIN_COMBINATIONS.each do |i|
            win_index_1 = i[0]
            win_index_2 = i[1]
            win_index_3 = i[2]

            position_1 = board[win_index_1]
            position_2 = board[win_index_2]
            position_3 = board[win_index_3]

            if (position_1 == "X" && position_2 == "X" && position_3 == "X")
                return "X"
            elsif(position_1 == "O" && position_2 == "O" && position_3 == "O")
                return "O"
            else
                nil
            end
        end
    end
end
