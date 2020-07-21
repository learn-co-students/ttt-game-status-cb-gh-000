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
  [6,4,2]
];

def won?(board)
  board_positions = board_positions = get_board_positions(board)

  WIN_COMBINATIONS.each do |condition|
    exist = condition.all? { |e| board_positions.include?(e)  }
    if exist then
      if board[condition[0]] == board[condition[1]] && board[condition[2]] == board[condition[0]] then
        return condition
      end
    end
  end
  return nil
end

def get_board_positions(board)
  board_positions = Array.new
  index = 0
  board.each do |str|
    board_positions << index if position_taken?(board, index)
    index += 1
  end
  return board_positions
end

def full?(board)
  board_positions = get_board_positions(board)
  return board_positions.length == 9
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return full?(board) || won?(board)
end

def winner(board)
  won = won?(board)
  return won ? board[won[0]] : nil
end
