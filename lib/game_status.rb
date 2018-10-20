# Helper Method
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row wins
  [3, 4, 5], #middle row wins
  [6, 7, 8], #bottom row wins
  [0, 3, 6], #l colum wins
  [1, 4, 7], #M colum wins
  [2, 5, 8], #R colum wins
  [0, 4, 8], #diagonal wins
  [2, 4, 6]  #diagonal wins
]

def won?(board)
  x = "X"
  o = "O"
  counterX = 0
  counterY = 0

  WIN_COMBINATIONS[0].each do |win_combination|
    checkFor = board[win_combination]
     if checkFor.include?(x)
      counterX += 2
     elsif checkFor.include?(o)
      counterY += 1
     end
  end
  # puts counter
  if counterX == 6 || counterY == 3
    # puts WIN_COMBINATIONS[0]
    return WIN_COMBINATIONS[0]
  end

  counterX = 0
  counterY = 0

  WIN_COMBINATIONS[1].each do |win_combination|
    checkFor = board[win_combination]
     if checkFor.include?(x)
      counterX += 2
     elsif checkFor.include?(o)
      counterY += 1
     end
  end
  # puts counter
  if counterX == 6 || counterY == 3
    # puts WIN_COMBINATIONS[1]
    return WIN_COMBINATIONS[1]
  end

  counterX = 0
  counterY = 0

  WIN_COMBINATIONS[2].each do |win_combination|
    checkFor = board[win_combination]
     if checkFor.include?(x)
      counterX += 2
     elsif checkFor.include?(o)
      counterY += 1
     end
  end
  # puts counter
  if counterX == 6 || counterY == 3
    # puts WIN_COMBINATIONS[2]
    return WIN_COMBINATIONS[2]
  end

    counterX = 0
    counterY = 0

  WIN_COMBINATIONS[3].each do |win_combination|
    checkFor = board[win_combination]
     if checkFor.include?(x)
      counterX += 2
     elsif checkFor.include?(o)
      counterY += 1
     end
  end
  # puts counter
  if counterX == 6 || counterY == 3
    # puts WIN_COMBINATIONS[3]
    return WIN_COMBINATIONS[3]
  end

  counterX = 0
  counterY = 0

  WIN_COMBINATIONS[4].each do |win_combination|
    checkFor = board[win_combination]
     if checkFor.include?(x)
      counterX += 2
     elsif checkFor.include?(o)
      counterY += 1
     end
  end
  # puts counter
  if counterX == 6 || counterY == 3
    # puts WIN_COMBINATIONS[4]
    return WIN_COMBINATIONS[4]
  end

  counterX = 0
  counterY = 0

  WIN_COMBINATIONS[5].each do |win_combination|
    checkFor = board[win_combination]
     if checkFor.include?(x)
      counterX += 2
     elsif checkFor.include?(o)
      counterY += 1
     end
  end
  # puts counter
  if counterX == 6 || counterY == 3
    # puts WIN_COMBINATIONS[5]
    return WIN_COMBINATIONS[5]
  end

  counterX = 0
  counterY = 0

  WIN_COMBINATIONS[6].each do |win_combination|
    checkFor = board[win_combination]
     if checkFor.include?(x)
      counterX += 2
     elsif checkFor.include?(o)
      counterY += 1
     end
  end
  # puts counter
  if counterX == 6 || counterY == 3
    # puts WIN_COMBINATIONS[6]
    return WIN_COMBINATIONS[6]
  end

  counterX = 0
  counterY = 0

  WIN_COMBINATIONS[7].each do |win_combination|
    checkFor = board[win_combination]
     if checkFor.include?(x)
      counterX += 2
     elsif checkFor.include?(o)
      counterY += 1
     end
  end
  # puts counter
  if counterX == 6 || counterY == 3
    # puts WIN_COMBINATIONS[7]
    return WIN_COMBINATIONS[7]
  end
  return false
end

def full?(board)
  find = board.find {|key, value| key == " "}
  if find == " "
    # puts false
    return false
  else
    # puts true
    return true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    # puts "board not been won but is full"
    return true
  elsif won?(board) == false && full?(board) == false
    # puts "not full not won"
    return false
  else
    # puts "board is won"
    return false
  end
end

def over?(board)

  if won?(board) ==  false && full?(board) == true
    # puts "true for draw"
    return true
  elsif full?(board) == true && won?(board) != false
    # puts "true for won game when board is full"
    return true
  elsif full?(board) == false && won?(board) != false
    # puts "true for won game when board in not full"
    return true
  else
    # puts "in progress game"
    return false
  end

end

def winner(board)

  x = "X"
  o = "O"
  counterX = 0
  counterY = 0

  if won?(board) == false
    return nil
  end

  won?(board).each do |win_combination|
    checkFor = board[win_combination]
    if checkFor.include?(x)
      counterX += 2
    elsif checkFor.include?(o)
      counterY += 1
    end
  end

  if counterX == 6
    # puts "X"
    return "X"
  elsif counterY == 3
    # puts "O"
    return "O"
  end

end
