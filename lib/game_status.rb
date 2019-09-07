# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
]

def won?(board)
    WIN_COMBINATIONS.any? do |win_combination|
        win_c_1 = win_combination[0]
        win_c_2 = win_combination[1]
        win_c_3 = win_combination[2]

        if (board[win_c_1] == 'X' && board[win_c_2] == 'X' && board[win_c_3] == 'X')
            return win_combination
        elsif (board[win_c_1] == 'O' && board[win_c_2] == 'O' && board[win_c_3] == 'O')
            return win_combination
        else
            false
        end
    end
end

def full?(board)
    board.each_index.all? do |i|
        position_taken?(board,i)
    end
end

def draw?(board)
    full?(board) && !(won?(board))
end

def over?(board)
    full?(board) || won?(board) || draw?(board)
end

def winner(board)
    if won?(board)
        board[won?(board)[0]]
    end
end
