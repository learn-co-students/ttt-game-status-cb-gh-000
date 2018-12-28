# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  # ETC, an array for each win combination
]
def won?(board)
	if !(WIN_COMBINATIONS.any? do |indexs|
		if((indexs.all? do |values|
			board[values] == "O"
		end) or (indexs.all? do |values|
			board[values] == "X"
		end))
			return indexs
		end
	end)
		return false
	end
end

def full?(board)
  board.all? {|indexs| indexs != " "}
end

def draw?(board)
  if won?(board) == false and full?(board) == true
    return true
  elsif full?(board) == false and won?(board) == false
    return false
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if draw?(board)
    return true
  end
  if won?(board)
    return true
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
    arra = won?(board)
    return (board[arra[0]])
  end
end
