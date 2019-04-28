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
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination == [6,7,8]
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == position_2 && position_2 == position_3
        return win_combination
      else
        return false
      end
    end
    # win_index_1 = win_combination[0]
    # win_index_2 = win_combination[1]
    # win_index_3 = win_combination[2]
    #
    # position_1 = board[win_index_1]
    # position_2 = board[win_index_2]
    # position_3 = board[win_index_3]

    # if position_1 == position_2 && position_2 == position_3
    #   return win_combination
    # else
    #   false
    # end
  end
end

# print won?([" ", " ", " ", " ", " ", " ", " ", " ", " "])
# print won?(["X", "X", "X", "O", "O", " ", " ", " ", " "]) #top
print won?(["X", "O", "X", "O", "X", "X", "O", "X", "O"]) #draw
# print won?(["O", "O", " ", "X", "X", "X", " ", " ", " "]) #middle
# print won?(["O", " ", "X", "O", " ", "X", "O", " ", " "]) #left
