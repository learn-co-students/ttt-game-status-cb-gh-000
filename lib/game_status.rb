# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.each do |win_p|
    win_ind1 = win_p[0]
    win_ind2 = win_p[1]
    win_ind3 = win_p[2]

    position_1 = board[win_ind1]
    position_2 = board[win_ind2]
    position_3 = board[win_ind3]
    if position_1 == position_2 && position_1 == position_3 && position_1 != "" && position_1 != " " && position_1 != nil
      return win_p
    end
  end
  return false
end

def full?(board)
  return board.none? { |e|  e == "" || e == " " || e == nil}
end

def draw?(board)
  if won?(board)
    return false
  else
    return full?(board)
  end
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  winner = won?(board)
  if winner != false
    if board[winner[0]] == "X"
      return "X"
    elsif board[winner[0]] == "O"
      return "O"
    end
  else
    return nil
  end
end
