class Transaction
  DEFALT_BALANCE = 0

  def initialize
    @balance = DEFALT_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end
end