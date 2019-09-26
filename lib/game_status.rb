# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
def won?(board)
  WIN_COMBINATIONS.each do |array|
    # if array.all? {|elem| board[elem]==board[elem] && position_taken?(board, elem)}
    array.each do |index|
    if position_taken?(board, index) && board[array[0]]==board[array[1]] && board[array[1]]==board[array[2]]
      # if position_taken?(board, index) && index==array[0]
      return array
      end
    end
  end
  return false
end

def full?(board)
  board.none? {|index| index == " "}
end

def draw?(board)
  !won?(board)&&full?(board)
end

def over?(board)
  won?(board)||draw?(board)||full?(board)
end

def winner(board)
  if input = won?(board)
    board[input[0]]
end
end
