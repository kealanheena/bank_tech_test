require_relative 'transaction'

class Account
  DEFAULT_BALANCE = 0
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @statement = []
  end

  def withdraw(amount)
    transaction = Transaction.new(amount, @balance)
    @statement.unshift({ date: transaction.date, credit: 0, 
                         debit: amount, balance: @balance = transaction.withdraw })
  end

  def deposit(amount)
    transaction = Transaction.new(amount, @balance)
    @statement.unshift({ date: transaction.date, credit: amount, 
                         debit: 0, balance: @balance = transaction.deposit })
  end

  def display
    puts 'date || credit || debit || balance'
    @statement.each { |transaction|
      puts "#{transaction[:date]} || #{'%.2f' % transaction[:credit]} ||" +
           " #{'%.2f' % transaction[:debit]} || #{'%.2f' % transaction[:balance]}"
    }
  end
end
