# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
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

  position=Array.new
  combination=[]
  WIN_COMBINATIONS.each do|combination|
    combination.each do|index|
      position.push(board[index])
    end
    if position == ["X", "X", "X"] || position == ["O","O", "O"]
      return combination
    else
      position.clear
    end

  end
  return false
end

def full?(board)
  board.each do|element|
    if element == " " || element == "" || element==nil
      return false
    end
  end
end

def draw?(board)
  if won?(board) == false && full?(board) != false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  temp = Array.new
  index =[]
  if over?(board) && won?(board) !=false
    won_index = won?(board)
    if won_index != false
      won_index.each do|index|
        temp.push(board[index])
      end
      if temp == ["X", "X","X"]
        return "X"
      elsif temp ==["O", "O", "O"]
        return "O"
      end
    end
  end
end
