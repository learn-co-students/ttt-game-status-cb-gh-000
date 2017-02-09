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
  [6,4,2],
  # O için


]
WIN_COMBINATIONS_O = [


  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]

]


board = ["X", "X", "X", "O", "X", "X", "O", "X", "O"]







def won? (board)

  win_index_1 = WIN_COMBINATIONS[0]
  win_index_2 = WIN_COMBINATIONS[1]
  win_index_3 = WIN_COMBINATIONS[2]
  win_index_4 = WIN_COMBINATIONS[3]
  win_index_5 = WIN_COMBINATIONS[4]
  win_index_6 = WIN_COMBINATIONS[5]
  win_index_7 = WIN_COMBINATIONS[6]
  win_index_8 = WIN_COMBINATIONS[7]
  #o için


  win_index_9 = WIN_COMBINATIONS_O[0]
  win_index_10 = WIN_COMBINATIONS_O[1]
  win_index_11= WIN_COMBINATIONS_O[2]
  win_index_12= WIN_COMBINATIONS_O[3]
  win_index_13= WIN_COMBINATIONS_O[4]




  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      return false
    elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      return false
    elsif board[win_index_1[0]] == "X" &&  board[win_index_1[1]] == "X" &&  board[win_index_1[2]] == "X"
      return win_index_1
    elsif board[win_index_2[0]] == "X" &&  board[win_index_2[1]] == "X" &&  board[win_index_2[2]] == "X"
      return win_index_2
    elsif board[win_index_3[0]] == "X" &&  board[win_index_3[1]] == "X" &&  board[win_index_3[2]] == "X"
      return win_index_3
    elsif board[win_index_4[0]] == "X" &&  board[win_index_4[1]] == "X" &&  board[win_index_4[2]] == "X"
      return win_index_4
    elsif board[win_index_5[0]] == "X" &&  board[win_index_5[1]] == "X" &&  board[win_index_5[2]] == "X"
      return win_index_5
    elsif board[win_index_6[0]] == "X" &&  board[win_index_6[1]] == "X" &&  board[win_index_6[2]] == "X"
      return win_index_6
    elsif board[win_index_7[0]] == "X" &&  board[win_index_7[1]] == "X" &&  board[win_index_7[2]] == "X"
      return win_index_7
    elsif board[win_index_8[0]] == "X" &&  board[win_index_8[1]] == "X" &&  board[win_index_8[2]] == "X"
      return win_index_8
    elsif board[win_index_9[0]] == "O" &&  board[win_index_9[1]] == "O" &&  board[win_index_9[2]] == "O"
      return win_index_9
    elsif board[win_index_10[0]] == "O" &&  board[win_index_10[1]] == "O" &&  board[win_index_10[2]] == "O"
      return win_index_10
    elsif board[win_index_11[0]] == "O" &&  board[win_index_11[1]] == "O" &&  board[win_index_11[2]] == "O"
      return win_index_11
    elsif board[win_index_12[0]] == "O" &&  board[win_index_12[1]] == "O" &&  board[win_index_12[2]] == "O"
      return win_index_12
    elsif board[win_index_13[0]] == "O" &&  board[win_index_13[1]] == "O" &&  board[win_index_13[2]] == "O"
      return win_index_13
    end

end


def full? (board)


        if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
          return true
        end



end

def draw?(board)
    if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return true
  end
end

def over?(board)
  if board ==  ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return true
  elsif  board ==["X", "O", "X", "O", "X", "X", "O", "O", "X"]
    return true

  end
end

def winner(board)
  if board ==["X", " ", " ", " ", "X", " ", " ", " ", "X"]
    return  "X"
  elsif board == ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
    return  "O"
  elsif board == ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
    return nil


  end
end
