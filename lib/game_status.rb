# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
    WIN_COMBINATIONS.each do |combination|
        windex_1 = combination[0]
        windex_2 = combination[1]
        windex_3 = combination[2]

        pos_1 = board[windex_1]
        pos_2 = board[windex_2]
        pos_3 = board[windex_3]

        if (pos_1 == pos_2 && pos_2 == pos_3)
            if pos_1 == " "
                false
            elsif pos_1 == "X" || pos_1 == "O"
                return combination
            else
                false
            end
        else
            false
        end
    end
    false
end

def full?(board)
    board.each do |combination|
        if combination == " "
            return false
        end
    end
    return true
end

def draw?(board)
    if won?(board)
        false
    elsif full?(board)
        true
    else
        false
    end
end

def over?(board)
    if won?(board) || full?(board) || draw?(board)
        true
    else
        false
    end
end

def winner(board)
    if won?(board)
        return board[won?(board)[0]]
    else
        nil
    end
    return nil
end
