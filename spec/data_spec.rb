require 'bank_data'

describe BankData do
  describe '#initialize' do
    it 'should be initialized with a default balance of 0' do
      data = BankData.new
      expect(data.balance).to eq format('%.2f', 0)
    end

    it 'should be able to initialized with a balance of 100' do
      data = BankData.new(100)
      expect(data.balance).to eq format('%.2f', 100)
    end
  end

  describe '#deposit' do
    before :all do
      @bank_data = BankData.new(100)
      @time = Time.now.strftime('%d/%m/%Y at %H:%M')
    end

    # it 'returns the date of the transaction' do
    #   expect().to include(date: @time)
    # end
  end

  # describe '#return' do

  #   it 'returns the date of the transaction' do
  #     expect(@data.return).to include(date: @time)
  #   end

  #   it 'returns the amount of money deposited' do
  #     expect(@data.return).to include(deposit: 100)
  #   end

  #   it 'returns the amount of money withdrawn' do
  #     expect(@data.return).to include(withdrawl: 100)
  #   end
  # end

end
