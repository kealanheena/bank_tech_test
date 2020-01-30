require 'account'

describe Account do
  before :each do
    @account = Account.new
    @time = Time.now.strftime('%d/%m/%Y')
  end

  describe '#deposit' do
    it 'should record the date of the transaction' do
      expect(@account.deposit(10).first).to include(time: @time)
    end

    it 'should store the amount deposited' do
      expect(@account.deposit(10).first).to include(credit: 10)
    end

    it 'should have a current balance of 100 after a deposit of 100' do
      expect(@account.deposit(100).first).to include(balance: 100)
    end
  end

  describe '#withdraw' do
    it 'should store the amount deposited' do
      @account.deposit(10)
      expect(@account.withdraw(10).first).to include(debit: 10)
    end

    it 'should have a current balance of 100 after a deposit of 200 followed by a withdrawal of 100' do
      @account.deposit(200)
      expect(@account.withdraw(100).first).to include(balance: 100)
    end
  end

  describe '#display' do
    it 'should show all transactions in a grid format' do
      expect { @account.display }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'should show all transactions in a grid format' do
      @account.deposit(10)
      expect { @account.display }.to output("date || credit || debit || balance\n#{@time} || 10.00 || 0.00 || 10.00\n").to_stdout
    end
  end
end
