class BankData
  DEFAULT_BALANCE = 0
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    { time: Time.now.strftime('%d/%m/%Y'),
      deposit: amount,
      withdrawl: format('%.2f', 0),
      balance: format('%.2f', (@balance.to_f + amount)) }
  end
end
