# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =  [
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
  WIN_COMBINATIONS.each do |combination|
    state1 = board[combination[0]]
    state2 = board[combination[1]]
    state3 = board[combination[2]]
    return combination if position_taken?(board, combination[0]) && state1 == state2 && state2 == state3
  end
  false
end

def full?(board)
  !(board.include?(" ") || board.include?(nil))
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  (combination = won?(board)) ? board[combination[0]] : nil
end
