# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
def get_win_combinations()
  i=0
  n=0
  m=[]
  while i<3 do
    temp_m=[]
    j=0
    while j<3 do
      temp_m[j]=3*i+j
      j+=1
    end
    m[n]=temp_m
    n+=1
    i+=1
  end
  i=0
  while i<3 do
    temp_m=[]
    j=0
    while j<3 do
      temp_m[j]=3*j+i
      j+=1
    end
    m[n]=temp_m
    n+=1
    i+=1
  end
  i=0
  temp_m=[]
  while i<3 do
    temp_m[i]=3*i+i
    i+=1
  end
  m[n]=temp_m
  n+=1
  i=0
  temp_m=[]
  while i<3 do
    temp_m[i]=3*i+(2-i)
    i+=1
  end
  m[n]=temp_m
  return m
end

WIN_COMBINATIONS=get_win_combinations()

def won?(board)
  combination=nil
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all?{|index| position_taken?(board, index)}
      if win_combination.all?{|index| board[index] == "X"} ||
        win_combination.all?{|index| board[index] == "O"}
        combination=win_combination
        break
      end
    end
  end
  return combination
end

def full?(board)
  indexes=[]
  0.upto(board.length-1){|i| indexes[i]=i}
  return indexes.all?{|index| position_taken?(board, index)}
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return won?(board) || full?(board) || draw?(board)
end

def winner(board)
  b=nil
  combination=won?(board)
  if !combination.nil?
    b=board[combination[0]]
  end
  return b
end