require_relative '../lib/game_status.rb'

describe "./lib/game_status.rb" do
  describe 'WIN_COMBINATIONS' do
    it 'defines a constant WIN_COMBINATIONS with arrays for each win combination' do
      expect(WIN_COMBINATIONS.size).to eq(8)
      
      expect(WIN_COMBINATIONS).to include([0,1,2])
      expect(WIN_COMBINATIONS).to include([3,4,5])
      expect(WIN_COMBINATIONS).to include([6,7,8])
      expect(WIN_COMBINATIONS).to include([0,3,6])
      expect(WIN_COMBINATIONS).to include([1,4,7])
      expect(WIN_COMBINATIONS).to include([2,5,8])
      expect(WIN_COMBINATIONS).to include([0,4,8])
      expect(WIN_COMBINATIONS).to include([6,4,2])
    end
  end
  
  describe "#won?" do
    it 'returns false for a draw' do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(won?(board)).to be_falsey
    end

    it 'returns true for a win' do
      board = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(won?(board)).to be_truthy
    end

    # Must Spec Return Values
  end

  describe '#full?' do
    it 'returns true for a draw' do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(full?(board)).to be_truthy
    end

    it 'returns false for an in-progress game' do
      board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]

      expect(full?(board)).to be_falsey
    end    
  end

  describe '#over?' do
    it 'returns true for a draw' do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(over?(board)).to be_truthy
    end

    it 'returns true for a won game' do
      board = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(over?(board)).to be_truthy
    end    

    it 'returns false for an in-progress game' do
      board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]

      expect(over?(board)).to be_falsey
    end 
  end

  describe '#winner' do
    it 'return X when X won' do
      board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]

      expect(winner(board)).to eq("X")      
    end

    it 'returns O when O won' do
      board = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]

      expect(winner(board)).to eq("O")      
    end

    it 'returns nil when no winner' do
      board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]

      expect(winner(board)).to be_nil
    end   
  end
end