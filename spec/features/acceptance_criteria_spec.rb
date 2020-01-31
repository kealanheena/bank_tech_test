require 'account'
require 'timecop'

describe 'acceptance_critiria' do
  before :each do
    @account = Account.new

    Timecop.freeze(2012, 01, 10) do
      @account.deposit(1000)
    end

    Timecop.freeze(2012, 01, 13) do
      @account.deposit(2000)
    end

    Timecop.freeze(2012, 01, 14) do
      @account.withdraw(500)
    end
  end

  it 'should pass the acceptance critiria defined in the README.md' do
    expect { @account.display }.to output("date || credit || debit || balance\n" \
                                       "14/01/2012 || 0.00 || 500.00 || 2500.00\n" \
                                       "13/01/2012 || 2000.00 || 0.00 || 3000.00\n" \
                                       "10/01/2012 || 1000.00 || 0.00 || 1000.00\n").to_stdout
  end
end
