require 'bank_data'

describe BankData do
  before :each do
    @bank_data = BankData.new
    @time = Time.now.strftime('%d/%m/%Y')
  end

  describe '#store_data' do
    it 'should record the date of the transaction' do
      expect(@bank_data.store_data(0, 'deposit').first).to include(time: @time)
    end

    it 'should store the amount deposited' do
      expect(@bank_data.store_data(10, 'deposit').first).to include(credit: 10)
    end

    it 'should store the amount deposited' do
      @bank_data.store_data(100, 'deposit')
      expect(@bank_data.store_data(10, 'withdrawal').first).to include(debit: 10)
    end

    context 'should store the current balance' do
      it 'should store the current balance' do
        expect(@bank_data.store_data(100, 'deposit').first).to include(balance: 100)
      end

      it 'should store the current balance' do
        @bank_data.store_data(200, 'deposit')
        expect(@bank_data.store_data(100, 'withdraw').first).to include(balance: 100)
      end
    end
  end

  describe '#display' do
    it 'should show all transactions in a grid format' do
      expect { @bank_data.display }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'should show all transactions in a grid format' do
      @bank_data.store_data(10, 'deposit')
      expect { @bank_data.display }.to output("date || credit || debit || balance\n#{@time} || 10.00 || 0.00 || 10.00\n").to_stdout
    end
  end
end
