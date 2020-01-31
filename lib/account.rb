require_relative 'transaction'
require_relative 'statement'

class Account
  DEFAULT_BALANCE = 0
  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = DEFAULT_BALANCE
    @statement = statement
  end

  def withdraw(amount)
    transaction = Transaction.new(amount, @balance)
    @statement.add(transaction.date, 0, amount, @balance = transaction.withdraw)
  end

  def deposit(amount)
    transaction = Transaction.new(amount, @balance)
    @statement.add(transaction.date, amount, 0, @balance = transaction.deposit)
  end

  def display
    print @statement.show
  end
end
