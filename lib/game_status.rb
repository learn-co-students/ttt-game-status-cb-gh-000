# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)

    if board.all?{|i| i == " "}
        return false
    end

    WIN_COMBINATIONS.each do |condi|
        winning_combi = []
        condi.each do |i|
            winning_combi << board[i]
        end
        if winning_combi.all?{|i| i == "X"}
            return condi
            break
        elsif winning_combi.all?{|i| i == "O"}
            return condi
            break
        elsif winning_combi.all?{|i| i != "X" || i != "O"} && full?(board)
            return false

        end
    end
    return nil
end

def full?(board)
    if board.all?{|i| i == "X" || i == "O"}
        true
    elsif board.any?{|i| i == " "}
        false
    else
        false
    end
end

def draw?(board)
    if diagonal_win?(board)
        false
    elsif full?(board) && won?(board) == false
        true
    end
end

def diagonal_win?(board)
    diagonal1 = [0, 4, 8]
    diagonal2 = [2, 4, 6]
    diag_win1 = []
    diag_win2 = []
    diagonal1.each{|i| diag_win1 << board[i]}
    diagonal2.each{|i| diag_win2 << board[i]}

    if diag_win1.all?{|i| i == "X"} || diag_win1.all?{|i| i == "O"}
        true
    elsif diag_win2.all?{|i| i == "X"} || diag_win2.all?{|i| i == "O"}
        true
    else
        false
    end
end

def over?(board)
    if !(won?(board).nil?) && full?(board)
        true
    elsif won?(board)
        true
    elsif draw?(board)
        true
    elsif full?(board) == false && won?(board).nil?
        false
    end
end

def winner(board)
    win = won?(board)
    if win
        if board[win[1]] == "X"
            "X"
        elsif board[win[1]] == "O"
            "O"
        end
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
board = ["X", "X", "X", "X", "X", "X", "O", "O", "X"]

print winner(board)
