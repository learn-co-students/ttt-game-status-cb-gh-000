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
  [2,4,6],
]

board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)

  true

  false

end

def full?(board)

end

def draw?(board)

end

def over?(board)

end

def winner?(board)

end


WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6],[1,4,7],[2,5,8]]
 def won? (board)
 #empty field
empty = board.all? do |field|
  field == " "
end
 if empty
  return false
end
 #win
WIN_COMBINATIONS.each do |set1|
  if (board[set1[0]] == board[set1[1]] && board[set1[1]]  == board[set1[2]])
    if (board[set1[0]] != " ")
      return set1
    end
  end
end
 #draw

  def full? (board)
  emptyfield = board.detect do |field|
    field == " "
  end
   if (emptyfield == nil)
    return true
  else
    return false
  end
 end

 if(full?(board) == true)
  return false
end
 end

def draw? (board)
   wina = false
 WIN_COMBINATIONS.each do |set1|
    if (board[set1[0]] == board[set1[1]] && board[set1[1]]  == board[set1[2]])
      if (board[set1[0]] != " ")
        wina = true
      end
    end
  end
 if (wina == true)
  return false
end

 if(full?(board) == true)
  return true
end
end
 def over? (board)
  if draw?(board)
    return true
  end
   if won? (board)
    return true
  end
end
 def winner (board)
   if draw? (board)
    return nil
  end
  if won? (board)
   WIN_COMBINATIONS.each do |set1|
    if (board[set1[0]] == board[set1[1]] && board[set1[1]]  == board[set1[2]])
      if (board[set1[0]] == "X")
        return "X"
      end
      if (board[set1[0]] == "O")
        return "O"
      end
    end
  end
end
end
