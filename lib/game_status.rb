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
    [2,4,6],
    [0,4,8],
]

def won?(board)
    WIN_COMBINATIONS.each do |combination|
        if(combination.all? {|i| board[i] == "X"} || combination.all? {|i| board[i] == "O"})
            return combination
        end
    end

    false
end

def full?(board)
    board.none? {|position| position == " "}
end

def draw?(board)
    (full?(board) && !won?(board))
end

def over?(board)
    draw?(board) || won?(board)
end

def winner(board)
    result = won?(board)

    if result
        board[result[0]]
    else
        nil
    end
end
