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
    WIN_COMBINATIONS.each do |comb|
        if board[comb[0]] == board[comb[1]] && board[comb[1]] == board[comb[2]] && (board[comb[0]] == "X" || board[comb[0]] == "O")
            return comb
        end
    end
    nil
end

def full?(board)
    board.size.times {|index| if !position_taken?(board, index) then return false end}
    true
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
    full?(board) || won?(board) || draw?(board)
end

def winner(board)
    game_result = won?(board)
    if game_result.nil?
        nil
    elsif board[game_result[0]] == "X"
        "X"
    else
        "O"
    end
end
