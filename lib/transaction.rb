class Transaction
  attr_reader :time

  def initialize
    @time = Time.now.strftime('%d/%m/%Y')
  end

  def deposit(amount, balance)
    balance + amount
  end

  def withdraw(amount, balance)
    raise 'insufficient funds' if (balance -= amount).negative?

    balance
  end 
end
