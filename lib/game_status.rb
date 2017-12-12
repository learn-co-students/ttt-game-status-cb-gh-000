# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

board = ["X", " ", "O", " ", "X", "O", " ", " ", "X"]
# def won?(board)
#     if position_taken?(board, 0) && position_taken?(board, 1) && position_taken?(board, 2)
#       if board[0] == board[1] && board[1] == board[2]
#         puts [0, 1, 2]
#         return [0, 1, 2]
#       end
#     elsif position_taken?(board, 3) && position_taken?(board, 4) && position_taken?(board, 5)
#       if board[3] == board[4] && board[4] == board[5]
#         puts[3, 4, 5]
#         return [3, 4, 5]
#       end
#     elsif position_taken?(board, 6) && position_taken?(board, 7) && position_taken?(board, 8)
#       if board[6] == board[7] && board[7] == board[8]
#         puts[ 6, 7, 8]
#         return [6, 7, 8]
#       end
#     elsif position_taken?(board, 0) && position_taken?(board,3) && position_taken?(board, 6)
#       if board[0] == board[3] && board[3] == board[6]
#         puts[0, 3, 6]
#         return [0, 3, 6]
#       end
#     elsif position_taken?(board, 1) && position_taken?(board, 4) && position_taken?(board, 7)
#       if board[1] == board[4] && board[4] == board[7]
#         puts[1, 4, 7]
#         return [1, 4, 7]
#
#       end
#     elsif position_taken?(board, 2) && position_taken?(board, 8) && position_taken?(board, 5)
#       if board[2] == board[5] && board[5] == board[8]
#         puts [2, 5, 8]
#         return [2, 5, 8]
#       end
#     elsif position_taken?(board, 0) && position_taken?(board, 4) && position_taken?(board, 8)
#         if board[0] == board[4] && board[4] == board[8]
#           puts [0, 4, 8]
#           return [0, 4, 8]
#         end
#     elsif position_taken?(board, 2) && position_taken?(board, 4) && position_taken?(board, 6)
#         if board[2] == board[4] && board[6] == board[2]
#           puts [2, 4, 6]
#           return [2, 4, 6]
#         end
#     else
#       puts false
#        return false
#     end
# end
def won?(board)
  if position_taken?(board, 0) && position_taken?(board, 1) && position_taken?(board, 2)
        if board[0] == board[1] && board[1] == board[2]
         return [0, 1, 2]
        end
  end
  if position_taken?(board, 3) && position_taken?(board, 4) && position_taken?(board, 5)
        if board[3] == board[4] && board[5] == board[4]
         return [3, 4, 5]
        end
  end
  if position_taken?(board, 6) && position_taken?(board, 7) && position_taken?(board, 8)
        if board[6] == board[7] && board[8] == board[7]
         return [6, 7, 8]
        end
  end
  if position_taken?(board, 0) && position_taken?(board, 3) && position_taken?(board, 6)
        if board[0] == board[3] && board[6] == board[0]
         return [0, 3, 6]
        end
  end

  if position_taken?(board, 2) && position_taken?(board, 5) && position_taken?(board, 8)
        if board[2] == board[5] && board[8] == board[2]
         return [2, 5, 8]
        end
  end
  if position_taken?(board, 0) && position_taken?(board, 4) && position_taken?(board, 8)
        if board[0] == board[4] && board[8] == board[4]
         return [0, 4, 8]
        end
  end
  if position_taken?(board, 2) && position_taken?(board, 4) && position_taken?(board, 6)
        if board[6] == board[2] && board[2] == board[4]
         return [2, 4, 6]
        end
  end
  if position_taken?(board, 1) && position_taken?(board, 4) && position_taken?(board, 7)
        if board[1] == board[4] && board[7] == board[4]
         return [1, 4, 7]
        end
  end
  return false
end


def full?(board)
  i = 0
  while i < 9
    if board[i] == " "
      return false
    end
    i += 1
  end
  return true
end


def draw?(board)
  if won?(board) == false && full?(board)
    return true
  end
end

def over?(board)
  if full?(board) == true || won?(board)
      return true
  end
end


def winner(board)
  if won?(board)
    r = won?(board)
    i = r[0]
    return board[i]
  end

end
