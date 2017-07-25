def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  x=Array.new
  o=Array.new
  num=0
  until num==9 do
    if board[num]=="X"
      x << num
    elsif board[num]=="O"
      o << num
    end
    num=num+1
  end
  num=0
  until num==WIN_COMBINATIONS.length do
    if WIN_COMBINATIONS[num]==x
      return x
    elsif WIN_COMBINATIONS[num]==o
      return o
    end
    num=num+1
  end
  return false
end

def full?(board)
  num=0
  until num==9 do
    if board[num]==" "
      return false
    end
    num=num+1
  end
  return true
end

def draw?(board)
  num=0
  until num==9 do
    if board[num]==" "
      return false
    end
    num=num+1
  end
  x=Array.new
  o=Array.new
  num=0
  until num==9 do
    if board[num]=="X"
      x << num
    elsif board[num]=="O"
      o << num
    end
    num=num+1
  end
  num=0
  until num==WIN_COMBINATIONS.length do
    i=0
    j=0
    WIN_COMBINATIONS[num].each do|n|
      if x.include? n
        i=i+1
      end
      if o.include? n
        j=j+1
      end
    end
    if i==3 || j==3
      return false
    end
    num=num+1
  end
  return true
end

def over?(board)
  full?(board)
end

def winner(board)
  x=Array.new
  o=Array.new
  num=0
  until num==9 do
    if board[num]=="X"
      x << num
    elsif board[num]=="O"
      o << num
    end
    num=num+1
  end
  num=0
  until num==WIN_COMBINATIONS.length do
    i=0
    j=0
    WIN_COMBINATIONS[num].each do|n|
      if x.include? n
        i=i+1
      end
      if o.include? n
        j=j+1
      end
    end
    if i==3
      return "X"
    elsif j==3
      return "O"
    end
    num=num+1
  end
end
