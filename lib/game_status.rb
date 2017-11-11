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
  [6,4,2]
]

def won?(board)
masyv= []
  WIN_COMBINATIONS.each do |masyvas|
    sk1 = masyvas[0]
    sk2 = masyvas[1]
    sk3 = masyvas[2]

    if board[sk1] =="X" && board[sk2] =="X" && board[sk3] =="X" || board[sk1] =="O" && board[sk2] =="O" && board[sk3] =="O"
      masyv = masyvas
      break
    else masyv = false
    end
  end
masyv
end

def full?(board)
ats = board.all? do |elementas|
    if elementas == "X" || elementas == "O"
      true
    else false
  end
end
  ats

end
def draw?(board)
  ans = won?(board)
  ans2 = full?(board)
  if ans == false && ans2 == true
    atsakymas = true
  else atsakymas = false
  end
end

def over?(board)
  ans1 = draw?(board)
  ans2 = won?(board)
  ans3 = full?(board)

  if ans1 == true || ans2 != false || ans3 == true
    atsakymas=true
  else atsakymas = false
  end
atsakymas
end

def winner(board)

  ans2 =won?(board)

  if ans2 == false
    atsakymas = nil
  elsif board[ans2[0]] =="X"
    atsakymas = "X"
  elsif board[ans2[0]] =="O"
    atsakymas = "O"

  end


atsakymas
end


# Define your WIN_COMBINATIONS constant
