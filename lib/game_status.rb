# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # horizontal win combinations
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  # vertical win combinations
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],

  # diagonal win combinations
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    position_1 = board[combination[0]]
    position_2 = board[combination[1]]
    position_3 = board[combination[2]]
    if (position_1 == position_2 && position_2 == position_3) && (position_1 == "X" || position_1 == "O")
       return combination
    end
  end
  false
end

def full?(board)
  !board.detect{|position| position.nil? || position.strip == ""}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end


def winner(board)
  winner = won?(board)
  if !winner
    return nil
  end
  board[winner[0]]
end
