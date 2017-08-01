# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


def check_win?(board, player)
  temp = Array.new
  board.map.with_index {|x,i| temp << i if x == player}
  if temp != nil && temp.count >= 3
    WIN_COMBINATIONS.each do |t|
      check = true
      t.each do |i|
        if !temp.include?(i)
          check = false
          break
        end
      end
      if check == true
        return t
      end
    end
    false
  else
    false
  end
end
def won? board
  r1 = check_win?(board, "X")
  r2 = check_win?(board, "O")
  return r1 if r1 != false
  return r2 if r2 != false
  false
end

def full? board
  !board.include?(" ")
end

def draw? board
  full?(board) && !won?(board)
end

def over? board
  won?(board) || draw?(board)
end

def winner board
  return "X" if check_win?(board, "X")
  return "O" if check_win?(board, "O")
end
