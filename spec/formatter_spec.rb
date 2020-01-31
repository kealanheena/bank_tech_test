require 'formatter'

describe '#format' do

  include Formatter

  it 'should return a statement formated in a grid' do
    expect(format([{ date: "31/01/2020", credit: '10.00', debit: '0.00', balance: '10.00' }])).to eq "date || credit || debit || balance\n31/01/2020 || 10.00 || 0.00 || 10.00\n"
  end
end
