# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6]
]

def won?(board)
  aux = 0
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    false
  else
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      pos_1 = board[win_index_1] # load the value of the board at win_index_1
      pos_2 = board[win_index_2] # load the value of the board at win_index_2
      pos_3 = board[win_index_3] # load the value of the board at win_index_3

      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return win_combination # return the win_combination indexes that won.
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return win_combination # return the win_combination indexes that won.
      else
        false
      end
    end
  end

  aux = 1
  if aux != 0
    false
  end
end

def full?(board)
  for i in 0..8
    if board[i] == " "
      false
      break
    else
      true
    end
  end
end

def draw?(board)
  if !won?(board)
    if full?(board)
      true
    else
      false
    end
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
a = won?(board)
puts "#{a}"
