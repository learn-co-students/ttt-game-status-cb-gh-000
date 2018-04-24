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

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if !(position_taken?(board, win_combination[0]) && position_taken?(board, win_combination[0]) &&
      position_taken?(board, win_combination[0]))
      false
    elsif ((board[win_combination[0]] == "X" && board[win_combination[1]] == "X" &&
      board[win_combination[2]] == "X") ||
      (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" &&
      board[win_combination[2]] == "O"))
      return win_combination
    else
      false
    end
  end
  false
end


def full?(board)
    counter = 0
    while counter < 9
        if !position_taken?(board, counter)
            return false
        end

        counter += 1
    end
    true
end

def draw?(board)
    if won?(board) || !full?(board)
        return false
    end

    true
end

def over?(board)
    if full?(board) || won?(board) || draw?(board)
        return true
    end
    false
end

def winner(board)
    result = won?(board)
    result ? board[result[0]] : nil
end