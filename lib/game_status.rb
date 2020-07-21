# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


board = ["O", "X", "O", "X", "O", " ", "X", "O", "X"]

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

def won?(board)
    counter = 0;
    WIN_COMBINATIONS.each do |trio|

        if trio.all? { |spot| position_taken?(board, spot) == true}  && (trio.all? {|spot| board[spot] == "X"} || trio.all? {|spot| board[spot] == "O"})
            return trio
        end

    end

    return false
end


def full?(board)
    board.all? do |spot|
        spot == "X" || spot == "O"
    end
end


def draw?(board)
    if full?(board) == true
        if won?(board) == false
            return true
        else
            return false
        end
    else
        false
    end
end


def over?(board)
    if won?(board) != false || full?(board) == true || draw?(board) == true
        return true
    else
        return false
    end
end


def winner(board)
    if won?(board) != false
        return board[won?(board)[0]]
    else
        return nil
    end
end
