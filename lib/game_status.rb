# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
      if (board[combination[0]]=="O" && board[combination[1]]=="O" && board[combination[2]]=="O") ||
         (board[combination[0]]=="X" && board[combination[1]]=="X" && board[combination[2]]=="X")
          return combination
          break
      end

    end
    return false

  end




# def won?(board)
#
#   if  board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#     return false
#   elsif full?(board)
#     return false
#   else
#     i=0
#     while i<9
#       puts i
#       combination=WIN_COMBINATIONS[i]
#         if (board[combination[0]]=="X" && board[combination[1]]=="X" && board[combination[2]]=="X")
#
#             return combination
#
#         elsif (board[combination[0]]=="O" && board[combination[1]]=="O" && board[combination[2]]=="O")
#
#           return combination
#         else
#
#         end
#         i=i+1
#
#       end
#         return false
#
#       end
#
# end


def full?(board)
  index=0
  while index<9
    if !position_taken?(board,index)
      return false
      break
    end
    index +=1
  end
    return true
end


def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if won?(board)||draw?(board)||full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  array=won?(board)
  if array!=false
    return board[array[0]]
  else
    return nil
  end
end
