# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def include_array?(board, comb)
  return comb.all? { |x| position_taken?(board, x) } && board[comb[0]] == board[comb[1]] && board[comb[1]] == board[comb[2]]
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
  [2, 4, 6],
]

def won?(board)
  if board.all? { |x| x == " " }
    return false
  elsif WIN_COMBINATIONS.none? { |comb| include_array?(board, comb) }
    return false
  else
    WIN_COMBINATIONS.each do |comb|
      if include_array?(board, comb)
        return comb
      end
    end
  end
end

def full?(board)
  return board.none? { |x| x == "" || x == " " || x == nil }
end

def draw?(board)
  return full?(board) && WIN_COMBINATIONS.none? { |comb| include_array?(board, comb) }
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
