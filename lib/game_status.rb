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
def winner(board)
  WIN_COMBINATIONS.each do |cur_combination|
    if board[cur_combination[0]] == board[cur_combination[1]] && board[cur_combination[1]] == board[cur_combination[2]]
        return board[cur_combination[0]] unless board[cur_combination[0]] == ' '
    end
  end
  return nil
end

def full?(board)
  !board.include?(' ')
end

def draw?(board)
  full?(board) && !winner(board)
end

def over?(board)
  draw?(board) || winner(board)
end

def won?(board)
  return false if board.all? { |c| c == ' '} || draw?(board)
  WIN_COMBINATIONS.each do |cur_combination|
    if board[cur_combination[0]] == board[cur_combination[1]] && board[cur_combination[1]] == board[cur_combination[2]]
        return cur_combination unless board[cur_combination[0]] == ' '
    end
  end
end
