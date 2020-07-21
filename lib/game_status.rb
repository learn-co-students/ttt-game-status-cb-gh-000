# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  win_combo = nil
  WIN_COMBINATIONS.each do |winning_combo|
    positions = [nil,nil,nil]
    winning_combo.each_with_index do |comboSpace, index|
        positions[index] = board[comboSpace]
    end
    ["X","O"].each do | player |
      if positions.all?{|pos| pos==player}
        win_combo = winning_combo
      end
    end
  end
  win_combo
end

def full?(board)
  board.all?{|pos| pos != " "}
end

def draw?(board)
  full?(board) and (not won?(board))
end

def over?(board)
  won?(board) or draw?(board)
end

def winner(board)
  winning_positions = won?(board)
  if !winning_positions.nil?
    winning_player = winning_positions[0]
    board[winning_player]
  else
    nil
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
