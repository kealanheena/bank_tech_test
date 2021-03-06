class Transaction
  attr_reader :date

  def initialize(amount, balance)
    @balance = balance
    @amount = amount
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def deposit
    @balance + @amount
  end

  def withdraw
    raise 'insufficient funds' if (@balance -= @amount).negative?

    @balance
  end 
end
