require 'statement'

describe Statement do

  describe '#show' do
    it 'should show the header of the statement with a line break at the end' do
      @statement = Statement.new
      expect(@statement.show).to eq 'date || credit || debit || balance\n'
    end
  end
end
