require 'bank_data'

describe BankData do
  before :each do
    @bank_data = BankData.new
    @time = Time.now.strftime('%d/%m/%Y')
  end

  describe '#deposit' do
    it 'should record the date of the transaction' do
      expect(@bank_data.deposit(10)).to include(time: @time)
    end

    it 'should record the amount deposited' do
      expect(@bank_data.deposit(10)).to include(deposit: 10)
    end

    it 'should add the deposit to the balance' do
      expect(@bank_data.deposit(10)).to include(balance: '10.00')
    end
  end

  describe '#withdrawl' do
    it 'should record the date of the transaction' do
      expect(@bank_data.withdrawl(5)).to include(time: @time)
    end

    it 'should record the amount withdrawn' do
      expect(@bank_data.withdrawl(10)).to include(withdrawl: 10)
    end

    it 'should subtract the withdrawl from the balance' do
      expect(@bank_data.withdrawl(10)).to include(balance: '-10.00')
    end
  end
end
