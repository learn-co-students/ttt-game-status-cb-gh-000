# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board=[" "," "," "," "," "," ","X","X","X"]
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
  counter=0
  condition = true
  combination = nil
  while counter < WIN_COMBINATIONS.size
    ind1 = WIN_COMBINATIONS[counter][0]
    ind2 = WIN_COMBINATIONS[counter][1]
    ind3 = WIN_COMBINATIONS[counter][2]
    pos1 = board[ind1]
    pos2 = board[ind2]
    pos3 = board[ind3]
    if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
      combination = [ind1,ind2,ind3]
    end
    counter+=1
  end
  if combination == nil
    false
  else
    combination
  end
end

def full?(board)
  !(board.any?{|i| i==" "})
end
def draw?(board)
  if full?(board)
    if won?(board)!=false
      false
    else
      true
    end
  else
    false
  end
end
def over?(board)
  if draw?(board)
    true
  elsif won?(board)!=false
    true
  elsif !(full?(board))
    false
  end
end

def winner(board)
  if over?(board)
    if won?(board)!=false
      var=won?(board)
      board[var[0]]
    else
      nil
    end
  end
end
