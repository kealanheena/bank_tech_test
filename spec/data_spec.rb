require 'bank_data'

describe BankData do
  describe '#return' do
    before :all do
      @data = BankData.new(100)
    end
    it 'returns the date of the transaction' do
      expect(@data.return).to include(date: Time.now.strftime('%d/%m/%Y'))
    end
    it 'returns the amount of money deposited' do
      expect(@data.return).to include(amount: 100)
    end
  end
end
