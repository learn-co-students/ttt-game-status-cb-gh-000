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
  [2,4,6]
]

def won?(board)
  comb =  false

  WIN_COMBINATIONS.each do |w|
    arr = []

    filled = w.all? do |i|
      arr << board[i]
      position_taken?(board,i)
    end

    if filled
      if(arr[0] == arr[1])
        if(arr[1] == arr[2])
          comb = w
        end
      end
    end

  end

  return comb
end

def full?(board)
  isit = true
  for i in 0...9
    if(!position_taken?(board,i))
      isit = false
      break
    end
  end
  return isit
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  token = nil
  a = won?(board)
  if a
    token = board[a[0]]
  end
  return token
end
