require 'bank_data'

describe BankData do
  describe '#store' do
    it 'keeps the date of the transaction' do
      data = BankData.new
      expect(data.store).to eq Time.now.strftime('%d/%m/%Y')
    end
  end
end
