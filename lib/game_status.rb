# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #First column
  [1,4,7], #Middle columns
  [2,5,8], #Last columns
  [0,4,8], #Diagnol
  [2,4,6] #Diagnol
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]
    all_pos = [win_index_1, win_index_2, win_index_3].all? do |index|
      position_taken?(board, index)
    end

    ((return win_combination) if [pos_1, pos_2, pos_3].uniq.count == 1) if all_pos
  end
  return false
end

def full?(board)
  num = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  all_pos = num.all? do |index|
    position_taken?(board, index)
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winner = won?(board)
  won?(board) ? board[winner[0]] : nil
end
