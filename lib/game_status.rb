# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle
  [6,7,8], #bottom row
  [0,3,6], #left columnt
  [1,4,7], #middle
  [2,5,8],  #right
  [0,4,8], #diagonal left
  [2,4,6] #diagonal right
]

def won?(board)
  WIN_COMBINATIONS.each do |member|

    position_1 = board[member[0]];
    position_2 = board[member[1]];
    position_3 = board[member[2]];

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return member;
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return member;
    end
  end

  return false;
end

def full?(board)
  if board.any? { |member| member == " " }
    return false;
  else
    return true;
  end
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true;
  else
    return false;
  end
end

def over?(board)
  if draw?(board)
    return true;
  elsif won?(board)
    return true;
  else
    return false;
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |member|

    position_1 = board[member[0]];
    position_2 = board[member[1]];
    position_3 = board[member[2]];

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return "X";
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return "O";
    end
  end

  return nil;
end
