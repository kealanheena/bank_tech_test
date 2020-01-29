class Transaction
  DEFALT_BALANCE = 0
  attr_reader :time

  def initialize
    @balance = DEFALT_BALANCE
    @time = Time.now.strftime('%d/%m/%Y')
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'insufficient funds' if (@balance -= amount).negative?

    @balance
  end 
end
