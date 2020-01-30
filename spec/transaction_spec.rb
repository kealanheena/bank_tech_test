require 'transaction'

describe Transaction do

  before :each do
    @transaction = Transaction.new(10, 100)
  end

  describe '#deposit' do
    it 'should add money to your balance' do
      expect(@transaction.deposit).to eq 110
    end
  end

  describe '#deposit' do
    it 'should subtract money from your balance' do
      expect(@transaction.withdraw).to eq 90
    end

    it 'should throw an error if a withdrawal would reduce your balance to below 0' do
      @transaction = Transaction.new(10, 0)
      expect { @transaction.withdraw }.to raise_error("insufficient funds")
    end
  end
end
