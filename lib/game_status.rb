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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |w|
    n=["X","O"]
    count = 0
    2.times do
      if board[w[0]]==n[count] and board[w[1]]==n[count] and board[w[2]]==n[count]
        return w
      else
        count+=1
      end
    end
  end
  return false
end

def full?(board)
 not board.any? { |e| e.strip=="" }
end

def draw?(board)
  not won? board and full? board
end

def over?(board)
  draw? board or won? board
end

def winner(board)
  arr = won? board
  if arr
    return board[arr[0]]
  else
    return nil
  end
end
