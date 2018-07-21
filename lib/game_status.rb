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
  if board.all?{|value| value == " "}
    return false
  else
    WIN_COMBINATIONS.each do |combi|
        if board[combi[0]] == board[combi[1]] && board[combi[1]] == board[combi[2]] && board[combi[0]] != " "
          return combi
        end
    end
      return nil
    end
end

def full?(board)
  if board.any?{|value| value == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
arr = won?(board)
  if arr
    return board[arr[0]]
  else
    return nil
  end
end
