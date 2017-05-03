# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[6,4,2],[0,4,8],[2,5,8],[1,4,7],[0,3,6],[6,7,8],[3,4,5],[0,1,2]]
def won?(board)
 winComb=[]
 WIN_COMBINATIONS.each do |comb|
     if board[comb[0]]!=" "&&board[comb[1]]!=" "&&board[comb[2]]!=" "
         if board[comb[0]]==board[comb[1]]&&board[comb[0]]==board[comb[2]]
             break winComb=comb
         else
             winComb=false
         end
     else
         winComb=false
     end
 end
 winComb
end

def full?(board)
    full=true
    board.each do |pos|
        if pos==" "
            full=false
        end
    end
    full
end

def draw?(board)
    draw=true
    if won?(board)
        draw=false
    elsif !full?(board)
        draw=false
    end
    draw
end

def over?(board)
    over=false
    if draw?(board)
        over=true
    elsif won?(board)
        over=true
    else
    end
    over
end

def winner(board)
    winner=""
    if won?(board)
        return board[won?(board)[0]]
    end
end
