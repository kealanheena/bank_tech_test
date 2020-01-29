require 'transaction'

describe Transaction do

  before :each do
    @transaction = Transaction.new
  end

  describe '#deposit' do
    it 'should add money to your balance' do
      expect(@transaction.deposit(100)).to eq 100
    end
  end
end