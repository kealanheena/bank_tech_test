require 'transaction'

describe Transaction do

  before :each do
    @transaction = Transaction.new
  end

  describe '#deposit' do
    it 'should add money to your balance' do
      expect(@transaction.deposit(100, 0)).to eq 100
    end
  end

  describe '#deposit' do
    it 'should subtract money from your balance' do
      expect(@transaction.withdraw(10, 100)).to eq 90
    end

    it 'should throw an error if a withdrawal would reduce your balance to below 0' do
      expect { @transaction.withdraw(11, 0) }.to raise_error("insufficient funds")
    end
  end
end
