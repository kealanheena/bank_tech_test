require 'statement'

describe Statement do

  before :each do
    @statement = Statement.new
  end

  describe '#show' do
    it 'should show the header of the statement with a line break at the end' do
      expect(@statement.show).to include "date || credit || debit || balance\n"
    end

    it 'should show the transactions added' do
      @statement.add('30/1/2020', 10, 0, 10)
      expect(@statement.show).to eq "date || credit || debit || balance\n30/1/2020 || 10.00 || 0.00 || 10.00\n"
    end 
  end

  describe '#add' do
    it 'should add a transactions infomation to the statement' do
      expect(@statement.add('30/1/2020', 10, 0, 10)).to eq([{ date: '30/1/2020', credit: 10, debit: 0, balance: 10 }])
    end
  end
end
