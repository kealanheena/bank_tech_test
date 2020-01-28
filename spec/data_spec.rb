require 'bank_data'

describe BankData do
  describe '#initialize' do
    it 'should be initialized with a default balance of 0' do
      data = BankData.new
      expect(data.balance).to eq 0
    end

    it 'should be able to initialized with a balance of 100' do
      data = BankData.new(100)
      expect(data.balance).to eq 100
    end
  end

  before :each do
    @bank_data = BankData.new
    @time = Time.now.strftime('%d/%m/%Y')
  end

  describe '#deposit' do
    it 'should record the date of the transaction' do
      expect(@bank_data.deposit(10)).to include(time: @time)
    end

    it 'should record the date of the transaction' do
      expect(@bank_data.deposit(10)).to include(deposit: 10)
    end

    it 'should add the deposit to the balance' do
      expect(@bank_data.deposit(10)).to include(balance: '10.00')
    end
  end

  describe '#withdrawl' do
    it 'should record the date of the transaction' do
      expect(@bank_data.withdrawl).to eq @time
    end
  end
end
