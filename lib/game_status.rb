# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS =[
[0,1,2], [3,4,5], [6,7,8],
[0,3,6], [1,4,7], [2,5,8],
[0,4,8], [2,4,6]
]

def won?(board)
  index = 0

  while (index<8)
    countX = 0
    countO = 0

    WIN_COMBINATIONS[index].each do |combinations|

      if (board[combinations] == "X")
        countX+=1
      elsif (board[combinations] == "O")
        countO+=1
      end

    end

    index+=1

      if (countX == 3 || countO == 3)
        return WIN_COMBINATIONS[index-1]
      elsif (index<8)
        next
      else
        return false
      end

  end

end


def full?(board)

  index = 0
  count = 0

  while (index<9)

    if (board[index] == " ")
      count+=1
    end

    index+=1
  end

  if (count>0)
    return false
  else
    return true
  end

end

def draw?(board)
  func1 = won?(board)
  func2 = full?(board)

  if (func1 == false && func2 == true)
    return true
  end
end

def over?(board)
  func1 = draw?(board)
  func2 = won?(board)
  func3 = full?(board)

  if (func1 == true)
    return true
  elsif(func2 != false)
    return true
  elsif(func3 == false)
    return false
  end

end

def winner(board)
  func1 = won?(board)

  if (func1!=false)

    if(board[func1[0]]=="X" && board[func1[1]]=="X" && board[func1[2]]=="X")
      return "X"
    elsif(board[func1[0]]=="O" && board[func1[1]]=="O" && board[func1[2]]=="O")
      return "O"
    end

  else
    return nil
  end
end
