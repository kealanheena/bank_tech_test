require 'bank_data'

describe BankData do
  before :each do
    @bank_data = BankData.new
    @time = Time.now.strftime('%d/%m/%Y')
  end

  describe '#deposit' do
    it 'should record the date of the transaction' do
      expect(@bank_data.deposit(10).first).to include(time: @time)
    end

    it 'should record the amount deposited' do
      expect(@bank_data.deposit(10).first).to include(deposit: '10.00')
    end

    it 'should add the deposit to the balance' do
      expect(@bank_data.deposit(10).first).to include(balance: '10.00')
    end
  end

  describe '#withdrawl' do
    it 'should record the date of the transaction' do
      expect(@bank_data.withdrawl(5).first).to include(time: @time)
    end

    it 'should record the amount withdrawn' do
      expect(@bank_data.withdrawl(10).first).to include(withdrawl: '10.00')
    end

    it 'should subtract the withdrawl from the balance' do
      expect(@bank_data.withdrawl(10).first).to include(balance: '-10.00')
    end
  end

  describe '#store_data' do
    it 'should record the date of the transaction' do
      expect(@bank_data.store_data(0, 'deposit')).to include(time: @time)
    end

    it 'should store the amount deposited' do
      expect(@bank_data.store_data(10, 'deposit')).to include(credit: 10)
    end

    it 'should store the amount deposited' do
      expect(@bank_data.store_data(10, 'withdrawal')).to include(debit: 10)
    end

    it 'should store the current balance' do
      expect(@bank_data.store_data(100, 'deposit')).to include(balance: 100)
    end
  end

  describe '#display' do
    it 'should show all transactions in a grid format' do
      @bank_data.deposit(10)
      expect { @bank_data.display }.to output("date || credit || debit || balance\n#{@time} || 10.00 || 0.00 || 10.00\n").to_stdout
    end
  end
end
