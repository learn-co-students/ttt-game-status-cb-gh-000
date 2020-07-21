# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[2,5,8],[1,4,7]
]


def won?(board)
  xIndex = []
  oIndex = []
  counter = 0
  board.each do |chr|
    if chr == "X"
      xIndex.push(counter)
    elsif chr == "O"
      oIndex.push(counter)
    end
    counter += 1
  end
  WIN_COMBINATIONS.any? do |e|  
    if (e - xIndex).empty? || (e - oIndex).empty?
      return e
    else
      false
      
    end
  end

end
def full?(board)
  counter = 0
  board.each { |chr| 
    if chr == "X" || chr == "O"
      counter += 1 
    end }
  if counter == 9
    true
  else
    false
  end
end
def draw?(board)
  if full?(board)
    if won?(board)
      false
    else
      true
    end
  else
    false
  end
end
def over?(board)
  if full?(board)
    true
  else
    false
  end
end
def winner(board)
  xIndex = []
  oIndex = []
  counter = 0
  board.each do |chr|
    if chr == "X"
      xIndex.push(counter)
    elsif chr == "O"
      oIndex.push(counter)
    end
    counter += 1
  end
  WIN_COMBINATIONS.any? do |e|  
    if (e - xIndex).empty? 
      return "X"

    elsif (e - oIndex).empty?
      return "O"
    end
  
      
    end
    return nil
  end
  

    
    