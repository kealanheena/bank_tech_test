class BankData
  DEFAULT_BALANCE = 0
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = format('%.2f', balance)
    @statement = []
  end

  def deposit(amount)
    { time: Time.now.strftime('%d/%m/%Y'),
      deposit: amount }
  end
end
