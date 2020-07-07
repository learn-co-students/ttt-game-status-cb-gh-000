# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]]==board[win_combination[1]])&&(board[win_combination[1]]==board[win_combination[2]])&&((board[win_combination[1]]=="X")||(board[win_combination[1]]=="O"))
      return win_combination
    end
  end
  return false
end

def full?(board)
  return !(board.include?(" "))
end

def draw?(board)
  return (full?(board)&&!won?(board))
end

def over?(board)
  return (draw?(board)||won?(board))
end

def winner(board)
  arr=won?(board)
  if arr!=false
    return board[arr[0]]
  end
  return nil
end
