# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  if [0,1,2,3,4,5,6,7,8].none?{|index| position_taken?(board,index)}
    return false
  end

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_taken?(board,win_index_1)
      if position_1 == position_2 && position_2 == position_3
        return win_combination
      else
        false
      end
    else
      false
    end
  end
  false
end

def full?(board)
  [0,1,2,3,4,5,6,7,8].all?{|index| position_taken?(board,index)}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if over?(board)
    if draw?(board)
      return nil
    elsif won?(board)
      win_combination = won?(board)
      return board[win_combination[0]]
    end
  end
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
