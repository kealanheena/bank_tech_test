require 'bank_data'
require 'timecop'

describe 'acceptance_critiria' do
  before :each do
    @data = BankData.new

    Timecop.freeze(2012, 01, 10) do
      @data.deposit(1000)
    end

    Timecop.freeze(2012, 01, 13) do
      @data.deposit(2000)
    end

    Timecop.freeze(2012, 01, 14) do
      @data.withdrawl(500)
    end
  end

  it 'should pass the acceptance critiria defined in the README.md' do
    expect { @data.display }.to output("date || credit || debit || balance" \
                                            "\n14/01/2012 || 0.00 || 500.00 || 2500.00" \
                                            "\n13/01/2012 || 2000.00 || 0.00 || 3000.00" \
                                            "\n10/01/2012 || 1000.00 || 0.00 || 1000.00\n").to_stdout
  end
end
