require_relative 'transaction'

class BankData
  DEFAULT_BALANCE = 0
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @statement = []
  end

  def store_data(amount, transaction_type)
    @transaction = Transaction.new
    if transaction_type == 'deposit'
      @statement.unshift({ time: @transaction.time, credit: amount, debit: 0, 
        balance: @balance = @transaction.deposit(amount, @balance) })
    else
      @statement.unshift({ time: @transaction.time, credit: 0, debit: amount, 
        balance: @balance = @transaction.withdraw(amount, @balance) })
    end
  end

  def display
    puts 'date || credit || debit || balance'
    @statement.each { |transaction|
      puts "#{transaction[:time]} || #{'%.2f' % transaction[:credit]} ||" +
           " #{'%.2f' % transaction[:debit]} || #{'%.2f' % transaction[:balance]}"
    }
  end
end
