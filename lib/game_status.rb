# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],
  [2,4,6]
]

def won?(board)
    WIN_COMBINATIONS.each do |combination|
        if board.all?{|box| box == " "}
            return false
        end
        position = []

        combination.each do |index|
            position << board[index]
        end

        if position.all?{|box| box == "X"} or position.all?{|box| box == "O"}
            return combination
        end
    end
    return false
end

def full?(board)
  if board.any?{|box| box == " "}
    return false
  else
    return true
  end
end

def draw?(board)
    if full?(board)
        if won?(board)
            return false
        end
        return true
    end
    return false
end

def over?(board)
    if full?(board) or won?(board) or draw?(board)
        return true
    end
    return false
end

def winner(board)
    if won?(board)
        return board[won?(board)[0]]
    end
end
