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
    [2,4,6],
]
def won?(board)
    WIN_COMBINATIONS.each do |combination|
        marksOK = true #same & is one of "O", "X"
        if  board[combination[0]] != board[combination[1]] ||
            board[combination[1]] != board[combination[2]]
            marksOK = false
        end
        next if marksOK == false

        combination.each do |index|
            if board[index] != "X" && board[index] != "O"
                marksOK = false
                break
            end
        end
        next if marksOK == false

        return combination
    end
    return false
end

def full?(board)
    board.each do |mark|
        if mark != "X" && mark != "O"
            return false
        end
    end
    return true
end

def draw?(board)
    if full?(board) && !won?(board)
        true
    else
        false
    end
end

def over?(board)
    if won?(board) || full?(board)
        true
    else
        false
    end
end

def winner(board)
    combination_won = won?(board)
    if combination_won != false
        board[combination_won[0]]
    else
        nil
    end
end
